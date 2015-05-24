class ControlController < ApplicationController
    before_action :authenticate_user!
    # before_action :admin_only, only: [:admin]
    layout 'admin_user'
    
    def index
        @notices = Notice.limit(8)
        @employees = current_employees.size
        @events = current_events.size
        if @events.size == 0
            @events = current_boss.events
        end
        
        @sales = 0
        @commission = 0
        current_sales.each do |sale|
            @sales += sale.cuantity 
            @commission += sale.event.commission.to_i * sale.cuantity
        end
#        current_employees.each do |employee|
#            @sales += Sale.get_sum(employee.id, "cuantity")
#        end
    end
    
    def show_messages
        @send_messages = current_messages.order("created_at DESC")
        @received_messages = Message.where(to: current_user.id).order("created_at DESC")        
    end
    
    def show_employees        
        @employees = current_employees
        @boss = current_boss
        @events = current_events.size
        if @events.size == 0
            @events = current_boss.events
        end
        @sales = 0
        @commission = 0
        current_sales.each do |sale|
            @sales += sale.cuantity             
            current_employees.each do |employee|
                @sales += Sale.get_sum(employee.id, "cuantity")
                employee.sales.each do |sales|
                    @commission += sales.event.commission.to_i * sales.cuantity
                end
            end
            @commission += sale.event.commission.to_i * sale.cuantity
        end
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
        @sales = current_sales
        @my_total = [Sale.get_sum(current_user.id, "total"), Sale.get_sum(current_user.id, "cuantity")]
        if current_boss
            @boss_total = [ Sale.get_sum(current_boss.id, "total"), Sale.get_sum(current_boss.id, "cuantity")]
        else
            @boss_total = [0,0]
        end
#        @total_team = 0
#        @total_entradas = 0
#        current_employees.each do |employee|
#            @total_team += Sale.get_sum(employee.id, "total")
#            @total_entradas += Sale.get_sum(employee.id, "cuantity")       
#        end        
    end

    
#    private
#    def admin_only         
#        if current_user.role != 'admin'
#            redirect_to root_path, notice: 'Access denied'
#        end
#    end
end
