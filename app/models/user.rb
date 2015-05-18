class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    after_initialize :set_default_role, :if => :new_record?
    has_many :business
    
    private
    def set_default_role
        unless self.role
            self.role ||= 'user'
        end
    end
end
