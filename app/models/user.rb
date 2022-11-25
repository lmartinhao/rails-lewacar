class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :matches
  has_many :rides, through: :matches
  has_one_attached :avatar
  validates :first_name, :last_name, :age, presence: true
  validates :age, numericality: { only_integer: true }

  def full_name
    "#{first_name} #{last_name}"
  end
end
