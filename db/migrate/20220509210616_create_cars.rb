class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :brand
      t.string :category
      t.string :model
      t.string :city
      t.integer :price
      t.text :description
      t.integer :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
