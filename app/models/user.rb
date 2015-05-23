require 'securerandom'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    after_initialize :set_default_data, :if => :new_record?
    
    # Aqui creamos las relacciones y el inverso de ellas.
    has_many :employees, :foreign_key => 'user_id', :class_name => "User"
    has_many :assignations
    has_many :sales
    has_many :messages
    belongs_to :plan
    has_many :events, :through => :assignations
    belongs_to :boss, inverse_of: :employees, :class_name => "User", :foreign_key => 'user_id'
    
    private
    def set_default_data
        unless self.role
            self.role ||= 'user'
            self.invitationHash ||= SecureRandom.hex(13)
            self.photo ||= 'http://placehold.ir/250x250'
            self.status ||= 'activo'
            self.plan ||= 1
        end
    end
end
