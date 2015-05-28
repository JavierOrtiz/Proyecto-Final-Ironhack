class HomeController < ApplicationController
    
    def index
        @user = User.new
    end
    
    def invite
        if params[:q] == nil
            redirect_to root_path
        else
            if !current_user
                @user = User.new        
                session[:invitationHash] = params[:q]
            else
                redirect_to control_index_path, alert: 'Ya estas registrado.'
            end
        end
    end
    def create
        if session[:invitationHash]
            @user = User.new user_params
            @boss = User.find_by_invitationHash session[:invitationHash]
            @user.user_id = @boss.id
            if @user.save
                redirect_to root_path
            else
                render :new
            end
        else
            @user = User.new user_params  
            @user.status = 'esperando'
            if @user.save
                redirect_to root_path, notice: 'Su cuenta se registro correctamente. Cuando sea aprobada recibiras un correo con informacion de como empezar.'
            else
                redirect_to root_path, notice: 'Hubo un error al registrar su cuenta, intentelo de nuevo por favor.'
            end
        end
    end 

    private    
    def user_params
        params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
    end
end
