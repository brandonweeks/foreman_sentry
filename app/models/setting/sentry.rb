class Setting::Sentry < ::Setting
  def self.load_defaults
    return unless super

    # This is required to create a new Setting::Sentry with :default set to a blank string
    Setting::BLANK_ATTRS.append 'sentry_dsn'
    Setting.transaction do
      [
        set('sentry_dsn', N_('The DSN of your Sentry server'), '', N_('Sentry DSN'))
      ].compact.each { |s| create! s.update(category: 'Setting::Sentry') }
    end

    true
  end
end
