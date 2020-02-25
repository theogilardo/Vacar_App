class PickupDropOffInRequest < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :availability, :string
    add_column :requests, :pick_up_date, :date
    add_column :requests, :drop_off_date, :date
  end
end
