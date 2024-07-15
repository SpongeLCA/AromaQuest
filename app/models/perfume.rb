class Perfume < ApplicationRecord
  has_many :perfume_results
  has_many :results, through: :perfume_results
  has_many :notes
  has_many :reviews
  has_many :favorites

  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :photo, presence: true
  validates :intensity, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
