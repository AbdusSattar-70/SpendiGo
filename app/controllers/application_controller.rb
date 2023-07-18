class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :allowed_params, if: :devise_controller?

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  # after successfull sign_up/sign_in devise method automatically will go
  def after_sign_in_path_for(_resource)
    categories_path
  end

  protected

  def allowed_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[photo name email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password current_password photo])
  end
end
