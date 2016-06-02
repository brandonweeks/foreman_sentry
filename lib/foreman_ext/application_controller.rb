ApplicationController.class_eval do
  alias_method :generic_exception_original, :generic_exception

  def generic_exception(exception)
    Raven.capture_exception(exception)
    generic_exception_original(exception)
  end
end
