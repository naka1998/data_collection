class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :pin, foreign_key: true
      t.string :description
      t.integer :level, null: false

      t.timestamps
    end
  end
end
