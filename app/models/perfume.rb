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
  validates :genre, inclusion: { in: ["Femme", "Homme", "Unisexe"] }
  validates :period, inclusion: { in: ["Journée", "Soirée"] }
  validates :season, inclusion: { in: ["Hiver", "Eté"] }
  validates :situations, inclusion: { in: ["un weekend intense", "un déjeuner entre amis", "un moment cocooning"] }
  validates :smell, inclusion: { in: ["des embruns rafraichissants", "un bouquet d’herbes et d’aromates", "un bouquet de fleurs", "un cocktail intense et puissant", "un fruit frais ou sucre", "un dessert très gourmand", "un jus d’agrumes vitamine", "une balade en foret", "un souvenir de vacances épicé", "un lait doux et vanille"] }
end
