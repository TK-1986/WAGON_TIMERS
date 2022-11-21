class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :brand, :year, :modele, :price, :description, presence: true
end
