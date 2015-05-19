class Control::UsersController < ApplicationController
    before_action :authenticate_user!

    layout 'admin_user'

    def update
        
    end
    
    def show
        @user = User.find_by_id params[:id]
    end
    
    def create
        
    end
    
    def destroy
        
    end
end
