class CreateItemTags < ActiveRecord::Migration[5.1]
  def change
    create_table :item_tags do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps
    end
  end
end
