class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.integer :number_of_seats
      t.string :registration_number
      t.string :transmission
      t.boolean :airconditioning
      t.string :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
