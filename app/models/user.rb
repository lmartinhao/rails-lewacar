class User < ApplicationRecord
  has_many :rides
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :age, presence: true
  validates :age, numericality: { only_integer: true }
end
