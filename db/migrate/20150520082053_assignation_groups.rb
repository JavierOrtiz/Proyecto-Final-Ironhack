class AssignationGroups < ActiveRecord::Migration
    def change
        create_table :assignation do |t|
            t.belongs_to :boss, index: true
            t.belongs_to :employees, index: true
            t.datetime :assignation_date
            t.datetime :assignation_end_date
            t.timestamps null: false
        end
    end
end