class CreateCar < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :miles
      t.boolean :ev, null: false, default: false
      t.timestamp :created_at
      t.timestamp :updated_at
      t.bigint :dealership_id
      t.index ["dealership_id"], name: "index_cars_on_dealership_id"
    end
  end
end
