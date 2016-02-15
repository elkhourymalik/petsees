class AddCollumnsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :category, :string
    add_column :offers, :price, :integer
  end
end
