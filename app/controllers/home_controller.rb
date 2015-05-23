class HomeController < ApplicationController
    
    def index
    end
    
    def invite
        @user = User.new        
        session[:invitationHash] = params[:q]
    end
    def create
        @user = User.new user_params
        @boss = User.find_by_invitationHash session[:invitationHash]
        @user.user_id = @boss.id
        binding.pry
        if @user.save
            redirect_to root_path
        else
            render :new
        end
    end 

    private    
    def user_params
        params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
    end
end
