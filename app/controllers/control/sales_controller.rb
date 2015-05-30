class Control::SalesController < ApplicationController
    layout 'admin_user'
    def new
        @sale = Sale.new
        @events  = []
        current_events.each do |employee|
            @events << employee
        end
        @array_events = @events.map { |event| [event.title, event.id] }
    end
    
    def show        
        @sale = Sale.find params[:id]
    end
    
    def active_sale
        Sale.change_status(params[:id])
        redirect_to control_sales_path, notice: 'Venta validada correctamente'
    end
    
    def create
        @sale = Sale.new params_sales
        @sale.user_id = current_user.id
        @sale.status = params[:status]
        @sale.event_id = params[:event_id]
        @sale.total = @sale.event.price * @sale.cuantity
        @sale.sold = Date.today
        if @sale.status == "Pagado"
            @sale.processed = Date.today
        end
        @sale.save!
        redirect_to control_sale_path(@sale), notice: 'Venta creada correctamente'
    end
    
    def destroy

    end
    
    def update
        
    end
    
    private
    
    def params_sales
        params.require(:sale).permit(:buyer, :phone, :email, :cuantity, :total, :sold, :processed, :status)

    end
end
