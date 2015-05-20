class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
        t.belongs_to :event, index: true
        t.belongs_to :user, index: true
        t.integer :cuantity
        t.integer :total
        t.date :sold
        t.string :status
        t.string :buyer
      t.timestamps 
    end
  end
end
