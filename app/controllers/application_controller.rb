class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if request.path == new_user_registration_path
      flash[:success] = "Welcome! You have signed up successfully."
    elsif request.path == new_user_session_path
      flash[:success] = "Signed in successfully."
    end 
    user_path(current_user)
  end 
  
  def after_sign_out_path_for(resource)
    flash[:success] = "Signed out successfully."
    root_path
  end 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end 

end