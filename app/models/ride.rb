class Ride < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :users, through: :matches
end
