require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
AppConfig = YAML.load_file(File.expand_path('../integration.yml', __FILE__))
Bundler.require(*Rails.groups)

module PmgMail
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.action_mailer.delivery_method = :smtp
    if mail_config = AppConfig['mail']
      config.action_mailer.tap do |c|
        if delivery_method = mail_config['delivery_method']
          c.delivery_method = delivery_method.to_sym
        end

        if smtp_config = mail_config['smtp']
          c.smtp_settings = smtp_config.symbolize_keys
        end

        if sendmail_config = mail_config['sendmail']
          c.sendmail_settings = sendmail_config.symbolize_keys
        end
      end
    end
  end
end
