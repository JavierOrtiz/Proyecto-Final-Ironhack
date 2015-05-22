class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.belongs_to :user, index: true
        t.string :status
        t.string :title
        t.text :content
        t.integer :to
      t.timestamps 
    end
  end
end
