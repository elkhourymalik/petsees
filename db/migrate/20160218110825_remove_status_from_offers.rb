class RemoveStatusFromOffers < ActiveRecord::Migration
  def change
    remove_column :offers, :status, :string
  end
end
