class CreateDealership < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.integer :zip
      t.boolean :operational, null: false
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
