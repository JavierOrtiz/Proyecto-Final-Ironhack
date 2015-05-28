require 'securerandom'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    after_initialize :set_default_data, :if => :new_record?
    
    # Aqui creamos las relacciones y el inverso de ellas.
    has_many :assignations
    has_many :sales
    has_many :messages
    has_many :notices    
    belongs_to :plan
    has_many :events, :through => :assignations
    
    has_many :employees, :foreign_key => 'user_id', :class_name => "User"
    belongs_to :boss, inverse_of: :employees, :class_name => "User", :foreign_key => 'user_id'
    
    def self.get_active
        return self.where( status: 'activo') 
    end
    
    def self.get_blocked
        return self.where(status: 'bloqueado')
    end
    
    def self.change_status(id)
        @blocked = self.find(id)
        if @blocked.status != 'activo'
            @blocked.status = 'activo' 
        else
            @blocked.status = 'bloqueado'
        end
        @blocked.save
    end
    
    def self.message_group!(sender, group_id, params)
        boss = self.find(group_id)
        boss.employees.each do |employee|
            Message.create_for_user!(sender, employee, params)
        end
        Message.create_for_user!(sender, boss, params)
    end
    
    def active?
        self.status == 'activo'
    end
    
    private
    def set_default_data
        unless self.role
            self.role ||= 'user'
            self.invitationHash ||= SecureRandom.hex(13)
            self.photo ||= 'http://placehold.ir/250x250'
            self.status ||= 'activo'
            self.plan_id ||= 2
        end
    end
end
