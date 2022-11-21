class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.references :user, null: false, foreign_key: true
      t.text :route
      t.date :date
      t.integer :price
      t.text :pickup_address
      t.time :time
      t.integer :passengers

      t.timestamps
    end
  end
end
