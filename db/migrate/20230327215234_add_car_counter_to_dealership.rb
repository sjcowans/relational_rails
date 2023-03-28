class AddCarCounterToDealership < ActiveRecord::Migration[5.2]
  def change
    add_column :dealerships, :cars_count, :integer, default: 0
  end
end

