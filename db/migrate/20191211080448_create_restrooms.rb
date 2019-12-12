class CreateRestrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :restrooms do |t|
      t.references :pin, foreign_key: true
      t.string :description
      t.boolean :is_multipurpose, null: false

      t.timestamps
    end
  end
end
