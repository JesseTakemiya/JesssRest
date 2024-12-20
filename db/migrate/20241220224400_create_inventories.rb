class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :ingradient_name
      t.integer :stock_quantity
      t.integer :threshold
      t.integer :reorder_quantity
      t.datetime :last_updated

      t.timestamps
    end
  end
end
