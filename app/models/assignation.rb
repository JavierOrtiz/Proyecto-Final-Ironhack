class Assignation < ActiveRecord::Base
    belongs_to :employee, :foreign_key => 'user_id', :class_name => "User"
    belongs_to :event
end
