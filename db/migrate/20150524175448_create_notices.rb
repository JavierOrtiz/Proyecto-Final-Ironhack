class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|

      t.timestamps null: false
    end
  end
end
