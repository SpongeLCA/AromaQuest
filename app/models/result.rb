class Result < ApplicationRecord
  belongs_to :user
  has_many :perfume_results
  has_many :perfumes, through: :perfume_results

  validates :name, presence: true
  validates :description, presence: true
  validates :answer_1, presence: true
  validates :answer_2, presence: true
  validates :answer_3, presence: true
  validates :answer_4, presence: true
  validates :answer_5, presence: true
  validates :answer_6, presence: true
  validates :answer_7, presence: true
  validates :answer_8, presence: true
  validates :answer_9, presence: true
  validates :answer_10, presence: true
end
