class AddUserIdToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :user_id, :string
  end
end
