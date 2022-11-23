class Ride < ApplicationRecord
  belongs_to :user

  geocoded_by :route
  after_validation :geocode, if: :will_save_change_to_route?
end
