class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :description
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
