class CreateAssignations < ActiveRecord::Migration
  def change
    create_table :assignations do |t|
        t.belongs_to :event, index: true
        t.belongs_to :user, index: true
        t.datetime :assignation_date
        t.datetime :assignation_end_date
        t.timestamps null: false
    end
  end
end
