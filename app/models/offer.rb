class Offer < ActiveRecord::Base
  has_many :orders
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  has_attachment :photo
  CATEGORIES = ["Dog", "Cat", "Fish"]
  PLACES = ["Apartment", "Garden", "Farm"]
  # validates :title, presence: true
  # validates :description, presence: true
  # validates :address, presence: true
  # validates :category, inclusion: {in: CATEGORIES}, presence: true
  # validates :place_type, inclusion: {in: PLACES}, presence: true
  # validates :price, presence: true
  # validates :photo, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
