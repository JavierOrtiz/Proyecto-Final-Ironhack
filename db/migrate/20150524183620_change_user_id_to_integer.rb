class ChangeUserIdToInteger < ActiveRecord::Migration
  def change
      remove_column :notices, :user_id
  end
end
