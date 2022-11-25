class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :brand, :year, :modele, :price, :description, presence: true

  BRANDS = ["Volkswagen", "Peugeot", "Mazerati", "Lancia", "Honda", "Citroen", "Mercedes", "Alfa Roméo", "BMW"]

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_modele,
    against: [:title, :synopsis],
    using: {
      tsearch: { prefix: true },
    }

  pg_search_scope :global_search,
    against: [:brand, :modele],
    using: {
      tsearch: { prefix: true },
    }
end
