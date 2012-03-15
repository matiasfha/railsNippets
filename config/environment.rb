# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

if Gem::VERSION >= "1.3.6"
    module Rails
	class GemDependency
           def requirement
               r = super
               (r == Gem::Requirement.default) ? nil : r
           end
        end
    end
end

Rails::Initializer.run do |config|
  config.gem 'warden', :version => '0.10.7'
  config.gem 'devise', :version => '1.0.8'
  config.gem 'formtastic', :version => '1.1.0'
  #config.gem 'highlight', :lib => 'simplabs/highlight'
  #config.gem 'ultraviolet'
  config.gem 'will_paginate', :version => '~> 2.3.11', :source => 'http://gemcutter.org'
  #config.gem 'web-app-theme', :lib => 'web_app_theme', :version => '0.5.3'
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  config.time_zone = 'UTC'

  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end
