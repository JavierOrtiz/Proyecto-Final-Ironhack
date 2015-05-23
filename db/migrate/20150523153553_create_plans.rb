class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
        t.string :name
        t.text :information
        t.string :price
        t.integer :max_income
        t.integer :max_users
        t.integer :max_events
      t.timestamps null: false
    end
  end
end
