# coding: utf-8
if ENV['USE_OFFICIAL_GEM_SOURCE']
  source 'https://rubygems.org'
else
  source 'https://ruby.taobao.org'
end

gem 'rails', '4.2.0'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'jbuilder'
gem 'turbolinks'
gem 'jquery-turbolinks'

gem 'actionpack-action_caching', '1.1.1'
gem 'rails-i18n'
gem 'rails_autolink', '>= 1.1.6'
gem 'md_emoji', '1.0.2'  # 快速访问各种表情图片的类
gem 'exception_notification'  # 出现异常错误等自动发送错误邮件

gem 'rails-perftest'  # 性能测试
gem 'ruby-prof' # 快速的代码分析器

# 上传组件
gem 'carrierwave', '~> 0.10.0'
gem 'carrierwave-upyun', '0.1.8'
gem 'mini_magick','3.7.0', require: false

# Mongoid 辅助插件
# gem 'mongoid', '4.0.0'
# gem 'mongoid-rails'
# gem 'mongoid_auto_increment_id', '0.6.5'
# gem 'mongoid_rails_migrations', '1.1.0'

gem 'mysql2'

# 用户系统
gem 'devise', '~> 3.4.1'
gem 'devise-encryptable', '0.2.0'

# 分页
gem 'will_paginate', '3.0.7'

# Bootstrap
gem 'anjlab-bootstrap-rails', '3.0.3.0', require: 'bootstrap-rails'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap_helper', '4.2.3'

# 三方平台 OAuth 验证登陆
gem 'omniauth', '~> 1.2.2'
gem 'omniauth-github', '~> 1.1.0'

# permission
gem 'cancancan', '~> 1.9.2'
gem 'hiredis', '~> 0.5.2'  # Redis 官方指定的 C 语言客户端开发包
# Redis 命名空间
gem 'redis-namespace','~> 1.3.1'

# 将一些数据存放入 Redis
gem 'redis-objects', '0.9.1'

# Markdown 格式 & 文本处理
gem 'redcarpet', '~> 3.0.0'  # 解析器HTML可扩展的Markdown
gem 'rouge', '~> 1.3.4'  # 简易替换pygments
gem 'auto-space', '0.0.4' # 自动给中文英文之间加入合理的空格

# YAML 配置信息
gem 'settingslogic', '~> 2.0.9'

# 队列
gem 'sidekiq', '3.3.0'
# Sidekiq Web
gem 'sinatra', '>= 1.4.5', :require => nil

# Faye 是一个基于发布和订阅模型的消息系统，基于 Bayeux 协议。为 Node.js 和 Ruby 提供了消息服务
gem 'faye-rails','2.0.0'

# 分享功能
gem 'social-share-button', '0.1.8'

# 表单
gem 'simple_form', '3.1.0'

# API
gem 'grape', '0.10.1'
gem 'grape-entity', '0.4.4'

# Mailer
gem 'postmark', '1.5.0'
gem 'postmark-rails', '0.10.0'

# 易于扩展Ruby编写的监测框架
gem 'god'

gem 'dalli', '2.7.2'  # memcached 客户端
gem 'eventmachine'
gem 'puma'
# Faye Server 需要
gem 'thin'
# for api 跨域
gem 'rack-cors', require: 'rack/cors'
gem 'rack-utf8_sanitizer'  # 清理请求中URI和HEADERS无效的UTF8字符

group :development, :test do
  gem 'capistrano','~> 3.3.0', require: false
  gem 'capistrano3-puma'
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  # gem 'capistrano-rbenv', require: false
  gem 'rspec-rails', '~> 3.1'
  gem 'factory_girl_rails'
  gem 'database_cleaner'  # 用于确保清洁状态进行测试
  gem 'capybara', '~> 2.3.0'  # 集成测试工具,模拟用户如何将与网站互动
  gem 'api_taster','0.6.0'  # 测试你的应用程序的API
  gem 'letter_opener'  # 当邮件从您的应用程序发送， Letter Opener将打开浏览器预览，而不是发送

  # 用于组合小图片
  gem 'sprite-factory', '1.6.1', require: false
  gem 'chunky_png', '1.3.3', require: false

  gem 'jasmine-rails', '~> 0.10.5'
end

group :production do
  gem 'newrelic_rpm'  # 绩效管理体系.提供关于Web应用程序性能的深层次信息
  gem 'newrelic_moped' # 规范Moped和Mongoid 3
end