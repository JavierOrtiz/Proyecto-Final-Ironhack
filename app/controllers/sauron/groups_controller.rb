class Sauron::GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only
    layout 'admin_sauron'
    
    def show
        # Buscamos el usuario con la id enviada por parametros y extraemos sus empleados, si no tiene devolvemos nil
        @group = User.find params[:id]
        if !@group.employees.empty?
            @group = @group.employees
        else
            @group = nil
        end
    end
    
    def change_status
        # Buscamos el usuario a bloquear, si es activo, invertimos.
        User.change_status(params[:id])
        redirect_to :back, alert: 'Actualizado correctamente'
    end
    
    private
    def admin_only         
        if current_user.role != 'admin'
            redirect_to root_path, alert: 'Acceso denegado >:D'
        end
    end
end
