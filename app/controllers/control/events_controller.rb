class Control::EventsController < ApplicationController
    before_action :authenticate_user!

    layout 'admin_user'
    
    def show
        @event = Event.find params[:id]
        @total = 0
        @event.sales.each do |sale|
            @total += sale.cuantity
        end        
    end
    
    def new
        @event = Event.new 
    end
    
    def create
        # Recibimos parametros filtrados y añadimos extras
        @event = Event.new event_params
        @event.user_id = current_user.id
        @event.flyer = 'http://placehold.it/400x600'
        # Si se guarda correctamente hacemos push en la tabla Assignations y volvemos a directorio eventos
        # Si no guarda, redirigimos con mensaje de error
        if @event.save
            user = current_user
            user.events.push(@event)
            redirect_to control_events_path, :alert => "Creado correctamente"
        else
            redirect_to new_control_event_path, :alert => "Se ha producido un error"
        end
    end
    
    def take
        # Comprobamos que el usuario se ajusta a los parametros de su plan
        # Si esta correcto, asignamos el evento, si no, devolvemos error.
        if current_user.events.size >= current_user.plan.max_events
            redirect_to control_events_path, :alert => "Necesitas ampliar tu plan"
        else
            event = Event.find params[:id]
            recurso = Assignation.where(user_id: current_user.id, event_id: event.id)
            # Comprobamos que el evento no esta asignado, si ya lo esta devolvemos error.
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
        # Buscamos la asignacion que relacciona usuario y evento, y la destruimos
        recurso = Assignation.where(user_id: current_user.id, event_id: params[:id])
        recurso.first.destroy
        redirect_to(control_events_path(), :alert => "Soltado correctamente")
  
    end
    
    private
    # Filtro de parametros que recibira el evento al crearse
    def event_params
        params.require(:event).permit(:title, :description, :commission, :capacity, :house, :date, :locate, :flyer, :price)
    end
end
