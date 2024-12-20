class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.datetime :time_in
      t.datetime :time_out
      t.integer :loyalty_points
      t.string :membership_status

      t.timestamps
    end
  end
end
