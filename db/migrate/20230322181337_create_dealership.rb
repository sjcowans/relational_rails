class CreateDealership < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.integer :zip
    end
  end
end
