class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    layout :layout_by_resource
    before_filter :configure_permitted_parameters, if: :devise_controller?


    protected

    def layout_by_resource
        if devise_controller? && resource_name == :user && action_name == "edit"
            "admin_user"
        else
            "application"
        end
    end
   

   

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :last_name, :email, :password, :password_confirmation, :remember_me) }
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
    end

end
