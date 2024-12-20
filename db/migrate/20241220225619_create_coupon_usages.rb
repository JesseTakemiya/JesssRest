class CreateCouponUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :coupon_usages do |t|
      t.datetime :date
      t.references :customer, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
