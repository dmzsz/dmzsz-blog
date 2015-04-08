class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      ## Database authenticatable
      t.string   :email,                default: "", null: false
      t.string   :email_md5
      t.boolean  :email_public
      t.string   :encrypted_password,   default: "", null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count,        default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      # Lockable
      t.integer  :failed_attempts,      default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
      t.string   :login,                  
      t.string   :name,                   
      t.string   :crypted_password,     default: "", null: false
      t.string   :password_salt,        default: "", null: false
      t.string   :persistence_token,    default: "", null: false
      t.string   :single_access_token,  default: "", null: false
      t.string   :perishable_token,     default: "", null: false
      t.string   :avatar_file_name,       
      t.string   :bio,                    
      t.string   :qq,                     
      t.string   :website,                
      t.string   :company,                
      t.string   :github,                 
      t.string   :twitter,                
      t.boolean  :verified,             default: false
      t.integer  :state,                default: 1
      t.boolean  :guest,                default: false
      t.string   :tagline,                
      t.integer  :topics_count,         default: 0
      t.integer  :replies_count,        default: 0
      t.string   :private_token,          
      t.string   :favorite_topic_ids,   default: "[]"
      t.datetime :updated_at
      t.datetime :created_at
    end

    add_index :users, :email,                unique: true
    add_index :users, :login,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
