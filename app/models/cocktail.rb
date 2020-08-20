class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  accepts_nested_attributes_for :ingredients

  validates :name, presence: true, uniqueness: true
end
