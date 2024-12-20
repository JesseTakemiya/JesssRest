class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.integer :number
      t.integer :capacity
      t.string :status
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
