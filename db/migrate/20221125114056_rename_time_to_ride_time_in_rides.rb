class RenameTimeToRideTimeInRides < ActiveRecord::Migration[7.0]
  def change
    rename_column :rides, :time, :ride_time
  end
end
