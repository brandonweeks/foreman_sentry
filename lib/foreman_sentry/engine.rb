require 'raven'

module ForemanSentry
  class Engine < ::Rails::Engine
    initializer 'foreman_sentry.load_default_settings', before: :load_config_initializers do
      require_dependency File.expand_path('../../../app/models/setting/sentry.rb', __FILE__)
    end

    initializer 'foreman_sentry.register_plugin', before: :finisher_hook do
      Foreman::Plugin.register :foreman_sentry do
      end
    end

    # Load after :load_environment_config for SETTINGS[:version]
    initializer 'foreman_sentry.configure_sentry', after: :load_environment_config do
      ::Raven.configure do |config|
        config.logger = Foreman::Logging.logger('foreman_sentry')
        config.dsn = Setting[:sentry_dsn]
        config.release = SETTINGS[:version].version
      end
    end

    initializer 'foreman_sentry_patch' do
      require 'foreman_ext/application_controller'
    end
  end
end
