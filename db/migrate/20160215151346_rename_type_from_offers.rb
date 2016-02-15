class RenameTypeFromOffers < ActiveRecord::Migration
  def change
    rename_column :offers, :type, :place_type
  end
end
