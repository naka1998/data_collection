class CreatePins < ActiveRecord::Migration[5.2]
  def change
    create_table :pins do |t|
      t.integer :type
      t.float :lat
      t.float :lng
      t.integer :floor

      t.timestamps
    end
  end
end
