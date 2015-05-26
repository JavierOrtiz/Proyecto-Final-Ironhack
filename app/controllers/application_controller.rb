class ApplicationController < ActionController::Base
    before_action :active_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    layout :layout_by_resource
    before_filter :configure_permitted_parameters, if: :devise_controller?

    # Declaramos variables globales para recurrir a datos usados habitualmente
    def current_boss
        @currentBoss ||= current_user.boss
    end
    def current_events
        @currentEvents ||= current_user.events
    end
    def current_sales
        @currentSales ||= current_user.sales
    end
    def current_employees
        @currentEmployees ||= current_user.employees
    end
    def current_messages
        @currentMessages ||= current_user.messages
    end
    def current_plans
        @currentPlan ||= current_user.plan
    end

    protected
    # Le decimos a devise que cuando entren a perfil carguen el diseño en el layout admin
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
    
    private
    
    def active_user!
        return if self.class.to_s == 'HomeController' || self.class.to_s == 'Devise::SessionsController'
        render(file: 'public/401.html', layout: 'application', status: :unauthorized) unless current_user and current_user.active?

    end

end
