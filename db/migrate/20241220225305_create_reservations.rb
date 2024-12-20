class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time
      t.integer :number_of_guest
      t.string :status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
