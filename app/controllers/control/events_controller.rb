class Control::EventsController < ApplicationController
    before_action :authenticate_user!

    layout 'admin_user'
    
    def show
        
    end
    
    def new
        @event = Event.new 
    end
    
    def create
        @event = Event.new event_params

        if @event.save
            redirect_to control_event_path(@event)
        else
            render 'new'
        end
    end
    
    private
    
    def event_params
        params.require(:event).permit(:title, :description, :commission, :capacity, :house, :date, :locate, :flyer)
    end
end
