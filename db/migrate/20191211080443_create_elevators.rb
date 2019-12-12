class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.references :pin, foreign_key: true
      t.string :description
      t.integer :from, null: false
      t.integer :to, null: false

      t.timestamps
    end
  end
end
