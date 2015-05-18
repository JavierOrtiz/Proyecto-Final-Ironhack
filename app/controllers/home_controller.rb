class HomeController < ApplicationController
    
    def index
        if current_user
            @people = User.find current_user.id
            render 'panel', layout: 'admin_user'            
        end
    end
end
