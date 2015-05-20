class ControlController < ApplicationController
    before_action :authenticate_user!
    # before_action :admin_only, only: [:admin]
    layout 'admin_user'
    
    def index
        @people = User.find current_user.id
        @events = current_user.events
        if @events.size == 0
            @boss = current_user.boss
            @events = @boss.events
        end       
    end
    
    def show_employees        
        @people = User.find current_user.id
        @employees = @people.employees
        @boss = @people.boss
    end
    
    def show_events
        if current_user.boss == nil
            @events = current_user.events
        else        
            @boss = current_user.boss
            @boss_events = @boss.events
            @events = current_user.events
        end
    end
    
    def show_sales      
        @sales = Sale.all
    end

    
#    private
#    def admin_only         
#        if current_user.role != 'admin'
#            redirect_to root_path, notice: 'Access denied'
#        end
#    end
end
