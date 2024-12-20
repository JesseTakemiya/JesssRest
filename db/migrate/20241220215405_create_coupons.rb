class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.decimal :discount_amount
      t.datetime :start_date
      t.datetime :expiration_date
      t.integer :usage_limit
      t.boolean :active

      t.timestamps
    end
  end
end
