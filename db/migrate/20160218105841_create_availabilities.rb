class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.date :start_date
      t.date :end_date
      t.integer :offer_id
    end
  end
end
