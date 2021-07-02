class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_date(event)
    format_string = event.date.year == DateTime.now.year ? '%d %b' : '%d %b %Y'

    event.date.strftime(format_string)
  end

  helper_method :render_date

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  end
end
