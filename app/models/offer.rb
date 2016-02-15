class Offer < ActiveRecord::Base
  has_many :orders
  belongs_to :user
  has_attachment :photo
end
