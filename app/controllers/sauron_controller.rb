class SauronController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only
    layout 'admin_sauron'
    
    def index
        @users = User.all
        @sales = Sale.get_total("cuantity")
        @events = Event.all
        @benefits = Sale.get_total("total")
    end
    
    private
    def admin_only         
        if current_user.role != 'admin'
            redirect_to root_path, notice: 'Acceso denegado >:D'
        end
    end
end
