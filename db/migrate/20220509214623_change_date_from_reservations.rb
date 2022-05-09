class ChangeDateFromReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :start_date, :datetime
    change_column :reservations, :end_date, :datetime
  end
end
