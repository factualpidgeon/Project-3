class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :postcode
      t.float :lat
      t.float :lon
      t.string :loc_id, index:true
      t.boolean :active

      t.timestamps null: false
    end
  end
end
