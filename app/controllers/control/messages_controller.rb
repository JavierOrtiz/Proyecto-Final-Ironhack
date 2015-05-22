class Control::MessagesController < ApplicationController
    before_action :authenticate_user!

    def mark_read
        message = Message.find params[:id] 
        message.status = "read"
        message.save
        redirect_to control_messages_path, :alert => "Mensaje leido"
    end
end
