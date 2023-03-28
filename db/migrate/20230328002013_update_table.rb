class UpdateTable < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cars, :ev, true, false
    change_column_default :cars, :ev, false
    change_column_null :dealerships, :operational, true, false
    change_column_default :dealerships, :operational, false
  end
end
