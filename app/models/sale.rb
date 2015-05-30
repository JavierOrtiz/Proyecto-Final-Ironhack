class Sale < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
    
    
    def self.get_sum(id, column)
        where(user_id: id).sum(column)
    end
    def self.get_total(column)
       all.sum(column)
    end
    
    def self.change_status id
        @sale = self.find(id)
        if @sale.status != 'Pagado'
            @sale.status = 'Pagado' 
            @sale.processed = Date.today
        else
            @sale.status = 'Reservado'
        end
        @sale.save
    end

#    def self.get_total_team(id)
#        me = User.find id
#        me.employees.each do |employee|
#            where(user_id: employee.id).sum(:total)
#        end
#    end
end
