class AddColumntToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :status, :string
  end
end
