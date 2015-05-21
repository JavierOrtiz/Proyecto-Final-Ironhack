class ControlController < ApplicationController
    before_action :authenticate_user!
    # before_action :admin_only, only: [:admin]
    layout 'admin_user'
    
    def index
        @employees = current_employees
        @events = current_events
        @sales = current_sales.size
        @employees.each do |employee|
            @sales += Sale.get_sum(employee.id, "cuantity")
        end
        
        if @events.size == 0
            @events = current_boss.events
        end       
    end
    
    def show_employees        
        @employees = current_employees
        @boss = current_boss
    end
    
    def show_events
        if current_user.boss == nil
            @events = current_events
        else        
            @boss = current_boss
            @boss_events = @boss.events
            @events = current_events
        end
    end
    
    def show_sales      
        @sales = Sale.all
        @my_total = [Sale.get_sum(current_user.id, "total"), Sale.get_sum(current_user.id, "cuantity")]
        @boss_total = [ Sale.get_sum(current_boss.id, "total"), Sale.get_sum(current_boss.id, "cuantity")]
        @total_team = 0
        @total_entradas = 0
        current_employees.each do |employee|
            @total_team += Sale.get_sum(employee.id, "total")
            @total_entradas += Sale.get_sum(employee.id, "cuantity")       
        end
        
    end

    
#    private
#    def admin_only         
#        if current_user.role != 'admin'
#            redirect_to root_path, notice: 'Access denied'
#        end
#    end
end
