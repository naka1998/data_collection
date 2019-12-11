class CreateSlopes < ActiveRecord::Migration[5.2]
  def change
    create_table :slopes do |t|
      t.string :description
      t.integer :level

      t.timestamps
    end
  end
end
