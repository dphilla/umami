class AddDefaultStatusToItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :status
    add_column :items, :status, :integer, default: 0
  end
end
