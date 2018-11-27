class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache)
    end
  end
end
