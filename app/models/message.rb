class Message < ActiveRecord::Base
    belongs_to :owner, :foreign_key => 'user_id', :class_name => "User"
    belongs_to :receiver, :foreign_key => 'to', :class_name => "User"
    after_initialize :set_default_owner, :if => :new_record?

    
    private
    def set_default_owner
        unless self.user_id
            self.user_id ||= current_user.id
        end
    end
end
