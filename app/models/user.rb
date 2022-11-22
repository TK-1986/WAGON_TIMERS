class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, presence: true
  has_many :bookings
  has_many :cars
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
