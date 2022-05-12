class AddColumnToCar < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :car_url, :string
  end
end
