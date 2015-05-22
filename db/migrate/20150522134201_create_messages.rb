class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.belongs_to :user, index: true
        t.date :date_send
        t.string :status
        t.string :title
        t.text :content
        t.integer :to
      t.timestamps null: false
    end
  end
end
