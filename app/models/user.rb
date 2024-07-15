class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :results
  belongs_to :cart
  has_many :reviews
  has_many :favorite_perfumes, through: :favorites, source: :perfume
  belongs_to :favorites
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :surname, presence: true
end
