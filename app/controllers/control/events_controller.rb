class Control::EventsController < ApplicationController
    before_action :authenticate_user!

    layout 'admin_user'

end
