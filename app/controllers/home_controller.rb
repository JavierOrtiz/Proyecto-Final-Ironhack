class HomeController < ApplicationController
    
    def index
        if current_user
            render 'panel', layout: 'admin_user'
        end
    end
end
