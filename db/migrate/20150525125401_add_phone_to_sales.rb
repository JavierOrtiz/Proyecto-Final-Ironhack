class AddPhoneToSales < ActiveRecord::Migration
  def change
    add_column :sales, :phone, :integer
    add_column :sales, :email, :string
  end
end
