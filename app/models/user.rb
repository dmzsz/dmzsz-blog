class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable,                :validatable,  :confirmable, :lockable,
         :timeoutable,              :omniauthable
  attr_accessor :password_confirmation
  ACCESSABLE_ATTRS = [
    :name,    :email_public,     :location, :company,             :bio,
    :website, :github,           :twitter,  :tagline,             :avatar,
    :by,      :current_password, :password, :password_confirmation]
  ALLOW_LOGIN_CHARS_REGEXP = /\A\w+\z/

  validates :login,
    format: { 
      with:    ALLOW_LOGIN_CHARS_REGEXP, 
      message: '只允许数字、大小写字母和下划线'},
    length:     {in: 3..20}, 
    presence:   true, 
    uniqueness: {case_sensitive: false}

  # has_and_belongs_to_many :following_nodes, class_name: :Node, inverse_of: :followers
  # has_and_belongs_to_many :following,       class_name: :User, inverse_of: :followers
  # has_and_belongs_to_many :followers,       class_name: :User, inverse_of: :following
  
  # belongs_to :location
  # has_many   :topics,        dependent:  :destroy
  # has_many   :notes
  # has_many   :replies,       dependent:  :destroy
  # has_many   :authorizations
  # has_many   :notifications, class_name: 'Notification::Base', dependent: :delete
  # has_many   :photos

  # scope      :hot,    -> { desc(:replies_count, :topics_count) }
  # scope      :recent, -> { desc(:created_at) }

  def email=(val)
    self.email_md5 = Digest::MD5.hexdigest(val || "")
    self[:email] = val
  end

  def login=(val)
    self[:login] = self[:email].split("@")[0]
  end

  def temp_access_token
    Rails.cache.fetch("user-#{self.id}-temp_access_token-#{Time.now.strftime("%Y%m%d")}") do
      SecureRandom.hex
    end
  end

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.where(login: /^#{login}$/i).first || self.where(email: /^#{login}$/i).first
  end

  # def password_required?
  #   return false if self.guest
  #   (authorizations.empty? || !password.blank?) && super
  # end

  def github_url
    return "" if self.github.blank?
    "https://github.com/#{self.github.split('/').last}"
  end

  def twitter_url
    return "" if self.twitter.blank?
    "https://twitter.com/#{self.twitter}"
  end

  def google_profile_url
    return "" if self.email.blank? or !self.email.match(/gmail\.com/)
    return "http://www.google.com/profiles/#{self.email.split("@").first}"
  end

  # 是否是管理员
  def admin?
    Setting.admin_emails.include?(self.email)
  end

  # 是否有 Wiki 维护权限
  def wiki_editor?
    self.admin? or self.verified == true
  end

  # 回帖大于 150 的才有酷站的发布权限
  def site_editor?
    self.admin? or self.replies_count >= 100
  end

  # 是否能发帖
  def newbie?
    return false if self.verified == true
    self.created_at > 1.week.ago
  end

  def blocked?
    return self.state == STATE[:blocked]
  end

  def deleted?
    return self.state == STATE[:deleted]
  end

  def has_role?(role)
    case role
      when :admin then admin?
      when :wiki_editor then wiki_editor?
      when :site_editor then site_editor?
      when :member then self.state == STATE[:normal]
      else false
    end
  end

  # before_create :default_value_for_create
  # def default_value_for_create
  #   self.state = STATE[:normal]
  # end

  # 注册邮件提醒
  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.delay.welcome(self.id)
  end

  # 保存用户所在城市
  before_save :store_location
  def store_location
    if self.location_changed?
      if not self.location.blank?
        old_location = Location.find_by_name(self.location_was)
        old_location.inc(users_count: -1) if not old_location.blank?
        location = Location.find_or_create_by_name(self.location)
        location.inc(users_count: 1)
        self.location_id = (location.blank? ? nil : location.id)
      else
        self.location_id = nil
      end
    end
  end

  STATE = {
    # 软删除
    deleted: -1,
    # 正常
    normal: 1,
    # 屏蔽
    blocked: 2,
  }

  def update_with_password(params={})
    if !params[:current_password].blank? or !params[:password].blank? or !params[:password_confirmation].blank?
      super
    else
      params.delete(:current_password)
      self.update_without_password(params)
    end
  end

end
