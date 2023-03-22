class AddDealershipIdToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :dealership_id, :integer
    add_index  :cars, :dealership_id
  end
end
