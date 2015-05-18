class ControlController < ApplicationController
    before_action :authenticate_user!
    # before_action :admin_only, only: [:admin]
    layout 'admin_user'
    
    def index
        @people = User.find current_user.id
    end
    
    def show_employees
        @people = User.find current_user.id
        @employees = @people.employees
        @boss = @people.boss
        render 'show_employees'
    end
    
#    private
#    def admin_only         
#        if current_user.role != 'admin'
#            redirect_to root_path, notice: 'Access denied'
#        end
#    end
end
