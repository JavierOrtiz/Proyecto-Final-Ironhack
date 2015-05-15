class ControlController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only, only: [:admin]
    
    private
    def admin_only         
        if current_user.role != 'admin'
            redirect_to root_path, notice: 'Access denied'
        end
    end
end
