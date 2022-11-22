class Car < ApplicationRecord

  BRANDS = ['Abarth','Alfa Roméo','Alpine','Austin', 'Aston Martin','Audi', 'BMW', 'Citroen', 'Honda', 'Jaguar', 'Lada', 'Lancia', 'Mazda', 'Mercedes', 'Nissan', 'Opel', 'Peugeot', 'Porsche', 'Renault', 'Seat', 'Subaru', 'Toyota', 'Volkswagen', 'Volvo']
  
  belongs_to :user
  has_many :bookings

  validates :brand, :year, :modele, :price, :description, presence: true
  validates :brand, inclusion: { in: BRANDS }

end
