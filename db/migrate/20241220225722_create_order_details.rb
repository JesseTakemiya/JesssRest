class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.decimal :price
      t.text :note
      t.string :status
      t.references :order, null: false, foreign_key: true
      t.references :memu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
