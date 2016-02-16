class Order < ActiveRecord::Base
  belongs_to :renter, foreign_key: "user_id", class_name: "User"
  belongs_to :offer

end
