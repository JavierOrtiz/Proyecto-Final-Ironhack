class AddPlanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :plan_id, :id
  end
end
