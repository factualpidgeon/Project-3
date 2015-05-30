class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.time :timestamp
      t.float :rainfall
      t.float :temp
      t.float :windspeed
      t.string :winddirection
      t.references :day, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
