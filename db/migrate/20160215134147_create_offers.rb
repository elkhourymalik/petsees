class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :type
      t.integer :animal_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
