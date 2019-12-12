class CreatePins < ActiveRecord::Migration[5.2]
  def change
    create_table :pins do |t|
      t.references :station, foreign_key: true
      t.integer :data_type, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.integer :floor, null: false

      t.timestamps
    end
  end
end
