class ChangeItemStatusToString < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :status, :string
  end
end
