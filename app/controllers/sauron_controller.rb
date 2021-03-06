class SauronController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only
    layout 'admin_sauron'
    
    def index
        @users = User.all
        @sales = Sale.get_total("cuantity")
        @events = Event.all
        @benefits = Sale.get_total("total")
        @messages = Message.all
        @peticiones = User.where status: 'esperando'
        users = {name: 'Usuarios', data: User.group_by_day(:created_at).count()}
        sales = {name: 'Ventas', data: Sale.group_by_day(:created_at).count()}
        events = {name: 'Eventos', data: Event.group_by_day(:created_at).count()}
        messages = {name: 'Mensajes', data: Message.group_by_day(:created_at).count()}


        @chart_data = [users, sales, events, messages];
    end
    
    def show_groups
        @groups = User.get_active()
        @groups_blocks = User.get_blocked()
    end
    
    def show_events
        @events = Event.order(:created_at)
    end
    
    def show_petitions
        @peticiones = User.where status: 'esperando'
    end
    
    def site_settings
        
    end
    
    private
    def admin_only         
        if current_user.role != 'admin'
            redirect_to root_path, alert: 'Acceso denegado >:D'
        end
    end
end
