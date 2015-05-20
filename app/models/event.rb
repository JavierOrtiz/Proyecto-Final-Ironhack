class Event < ActiveRecord::Base
#    belongs_to :user
    has_many :assignations
    has_many :employees, :foreign_key => 'user_id', :class_name => "User", :through => :assignation
    belongs_to :boss, inverse_of: :employees, :class_name => "User", :foreign_key => 'user_id'
end
