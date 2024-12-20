class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :time
      t.decimal :total_amount
      t.decimal :discount_amount
      t.string :status
      t.references :customer, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
