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
    end
    
    def show_events
        @owner = User.find current_user.id
        @events = @owner.events
    end
    
#    private
#    def admin_only         
#        if current_user.role != 'admin'
#            redirect_to root_path, notice: 'Access denied'
#        end
#    end
end
