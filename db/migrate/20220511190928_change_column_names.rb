class ChangeColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :cars_id, :car_id
    rename_column :reservations, :users_id, :user_id
  end
end
