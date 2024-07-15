class Magasin < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :lat, presence: true, numericality: true
  validates :long, presence: true, numericality: true
  validates :photo, presence: true
  validates :brand, presence: true
end
