class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :category
      t.integer :price

      t.timestamps null: false
    end
  end
end
