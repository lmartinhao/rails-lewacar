class Ride < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :users, through: :matches

  geocoded_by :route
  after_validation :geocode, if: :will_save_change_to_route?
end
