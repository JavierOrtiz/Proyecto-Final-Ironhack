class Control::MessagesController < ApplicationController
    before_action :authenticate_user!

    def mark_read
        # Buscamos el mensaje con la id enviada en parametros y cambiamos el "status" a "read"
        message = Message.find params[:id] 
        message.status = "read"
        message.save
        redirect_to control_messages_path, :alert => "Mensaje leido"
    end
    
    def show
        
    end
    
    def create
        # Recibmos parametros filtrados y asignamos 2 parametros mas que no acepta el formulario.
        @message = Message.new message_params
        @message.user_id = current_user.id
        @message.to = params[:to].to_i
        if @message.save
            redirect_to control_messages_path, :alert => "Enviado correctamente"
        else
            redirect_to control_messages_path, :alert => "Se ha producido un error"
        end
    end
    
    private

    def message_params
        params.require(:message).permit(:title, :content)
    end
end
