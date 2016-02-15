class RemoveAnimalIdFromOffers < ActiveRecord::Migration
  def change
    remove_column :offers, :animal_id, :integer
  end
end
