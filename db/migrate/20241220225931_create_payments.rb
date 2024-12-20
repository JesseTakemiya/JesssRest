class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :method
      t.string :amount
      t.datetime :date
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
