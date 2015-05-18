class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
        t.string :title
        t.text :description
        t.integer :capacity
        t.integer :user_id
        t.string :commission
        t.string :locate
        t.date :date
        t.string :house
      t.timestamps null: false
    end
  end
end
