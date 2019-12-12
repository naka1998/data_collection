class CreateSlopes < ActiveRecord::Migration[5.2]
  def change
    create_table :slopes do |t|
      t.references :pin, foreign_key: true
      t.string :description
      t.integer :level, null: false

      t.timestamps
    end
  end
end
