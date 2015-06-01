class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.int :postcode
      t.float :lat
      t.float :lon
      t.string :loc_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
