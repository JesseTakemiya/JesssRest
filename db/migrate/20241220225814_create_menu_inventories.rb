class CreateMenuInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_inventories do |t|
      t.integer :quantity_required
      t.references :menu, null: false, foreign_key: true
      t.references :inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
