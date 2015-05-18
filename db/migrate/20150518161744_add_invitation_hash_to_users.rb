class AddInvitationHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invitationHash, :string
  end
end
