class AddItemRecordPricetoOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :item_price_record, :decimal
  end
end
