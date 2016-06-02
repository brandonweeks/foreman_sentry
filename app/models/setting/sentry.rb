class Setting::Sentry < ::Setting
  def self.load_defaults
    return unless super

    # FIXME: this should work with an empty string
    Setting.transaction do
      [
        set('sentry_dsn', N_('The DSN of your Sentry server'), 'asdf', N_('Sentry DSN'))
      ].compact.each { |s| create s.update(category: 'Setting::Sentry') }
    end

    true
  end
end
