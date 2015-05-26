class Message < ActiveRecord::Base
    belongs_to :owner, :foreign_key => 'user_id', :class_name => "User"
    belongs_to :receiver, :foreign_key => 'to', :class_name => "User"
    after_initialize :set_default_data, :if => :new_record?

    def self.get_message_user(id)
        return self.where(to: id).order("created_at DESC") 
    end
    
    def self.get_unread_messages(id)
        return self.where(to: id, status: 'unread')
    end
    
    def self.create_for_user!(sender, user, params) 
        message = new self.(params)
        message.user = sender
        message.to = user
        message.save!
    end
    
    private
    def set_default_data
        unless self.user_id
            self.status ||= 'unread'
        end
    end
end
