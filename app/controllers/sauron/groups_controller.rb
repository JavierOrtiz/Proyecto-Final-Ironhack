class Sauron::GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only
    layout 'admin_sauron'
    
    def show
        @group = User.find params[:id]
        if !@group.employees.empty?
            @group = @group.employees
        else
            @group = nil
        end
    end
    
    def change_status
        @blocked = User.find params[:id]
        if @blocked.status == 'activo'
            @blocked.status = 'bloqueado' 
        else
            @blocked.status = 'activo'
        end
        @blocked.save
        redirect_to sauron_groups_path, alert: 'Grupo cambiado a ' + @blocked.status + ' correctamente'
    end
    
    private
    def admin_only         
        if current_user.role != 'admin'
            redirect_to root_path, alert: 'Acceso denegado >:D'
        end
    end
end
