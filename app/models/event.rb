class Event < ActiveRecord::Base
#    belongs_to :user
    has_many :employees, :foreign_key => 'user_id', :class_name => "User"
    belongs_to :boss, inverse_of: :employees, :class_name => "User", :foreign_key => 'user_id'
end
