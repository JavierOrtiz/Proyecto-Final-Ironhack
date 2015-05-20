class AddProcessedToSales < ActiveRecord::Migration
  def change
    add_column :sales, :processed, :date
  end
end
