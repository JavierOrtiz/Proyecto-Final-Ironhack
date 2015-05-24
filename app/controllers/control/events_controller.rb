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
        @event.user_id = current_user.id
        @event.flyer = 'http://placehold.it/400x600'
        
        if @event.save
            user = current_user
            user.events.push(@event)
            redirect_to control_events_path, :alert => "Creado correctamente"
        else
            redirect_to new_control_event_path, :alert => "Se ha producido un error"
        end
    end
    
    def take
        if current_user.events.size >= current_user.plan.max_events
            redirect_to control_events_path, :alert => "Necesitas ampliar tu plan"
        else
            event = Event.find params[:id]
            recurso = Assignation.where(user_id: current_user.id, event_id: event.id)
            if recurso.size == 1
                redirect_to control_events_path, :alert => "Error, el evento ya existe"
            else
                user = current_user
                user.events.push(event)
                redirect_to control_events_path, :alert => "Asignado correctamente"
            end  
        end
    end
    
    def drop
        recurso = Assignation.where(user_id: current_user.id, event_id: params[:id])
        recurso.first.destroy
        redirect_to(control_events_path(), :alert => "Soltado correctamente")
  
    end
    
    private
    
    def event_params
        params.require(:event).permit(:title, :description, :commission, :capacity, :house, :date, :locate, :flyer, :price)
    end
end
