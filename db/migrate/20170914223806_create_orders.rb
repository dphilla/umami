class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
