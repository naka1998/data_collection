class CreateRestrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :restrooms do |t|
      t.string :description
      t.boolean :is_multipurpose

      t.timestamps
    end
  end
end
