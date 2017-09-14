class ChangeItemStockLevelToStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :stock_level, :status
  end
end
