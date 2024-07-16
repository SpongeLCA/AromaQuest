class Perfume < ApplicationRecord
  has_many :perfume_results, dependent: :destroy
  has_many :results, through: :perfume_results
  has_many :notes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :photo, presence: true
  validates :intensity, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
