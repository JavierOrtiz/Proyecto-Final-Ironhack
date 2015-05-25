class Sauron::MessagesController < ApplicationController
    before_action :authenticate_user!

    def create
        User.message_group!(current_user, params[:id], message_params)
#        @message = Message.new message_params
#        @message.user_id = current_user.id
#        @message.to = params[:to].to_i
#        if @message.save
#            redirect_to control_messages_path, :alert => "Enviado correctamente"
#        else
#            redirect_to control_messages_path, :alert => "Se ha producido un error"
#        end
    end

    private

    def message_params
        params.require(:message).permit(:title, :content)
    end
end
