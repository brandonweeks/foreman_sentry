module Api
  BaseController.class_eval do
    rescue_from StandardError do |exception|
      Raven.capture_exception(exception)
      Foreman::Logging.exception('Action failed', exception)
      render_error 'standard_error',
                   status: :internal_server_error,
                   locals: { exception: exception }
    end
  end
end
