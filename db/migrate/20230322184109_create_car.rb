class CreateCar < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :miles
      t.boolean :ev
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
