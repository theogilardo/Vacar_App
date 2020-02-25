class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :car, foreign_key: true
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
