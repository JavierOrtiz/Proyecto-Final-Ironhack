class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    after_initialize :set_default_role, :if => :new_record?
    has_many :employees, :foreign_key => 'user_id', :class_name => "User"
    belongs_to :boss, inverse_of: :employees, :class_name => "User", :foreign_key => 'user_id'
    
    private
    def set_default_role
        unless self.role
            self.role ||= 'user'
        end
    end
end
