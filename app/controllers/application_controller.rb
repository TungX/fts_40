class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:name, :chat_word, :email,
      :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :chat_word, :email,
      :password, :password_confirmation, :current_password)}
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, alert: exception.message
  end
end
