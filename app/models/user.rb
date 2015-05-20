require 'securerandom'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    after_initialize :set_default_role, :if => :new_record?
    after_initialize :set_default_invitationHash, :if => :new_record?
    
    # Aqui creamos las relacciones y el inverso de ellas.
    has_many :employees, :foreign_key => 'user_id', :class_name => "User"
    has_many :events
    belongs_to :boss, inverse_of: :employees, :class_name => "User", :foreign_key => 'user_id'
    
    private
    def set_default_role
        unless self.role
            self.role ||= 'user'
        end
    end
    def set_default_invitationHash
        unless self.invitationHash
            self.invitationHash ||= SecureRandom.hex(13)
        end
    end
end
