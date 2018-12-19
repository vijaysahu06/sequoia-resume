require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SequoiaResumes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.filestack_rails.api_key = Rails.application.secrets[:filestack][:api_key]
    config.filestack_rails.client_name = Rails.application.secrets[:filestack][:client_name]

    config.filestack_rails.app_secret = Rails.application.secrets[:filestack][:app_secret]
    config.filestack_rails.security = {'call' => %w[pick store read convert] }
    # config.filestack_rails.security = {}

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
    
# filestack_key: 
# "AzaS8QJ9iQu2WPvvAKv5Nz"

# filestack_secret: 
# "JSAWFFSR6VB3NL3WXSLC3BTP5A"
