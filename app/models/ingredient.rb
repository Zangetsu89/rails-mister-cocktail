class Ingredient < ApplicationRecord
  has_many :doses

  TYPES = []


  Ingredient.all.each do |i|
    TYPES << i
  end


  validates :name, presence: true, uniqueness: true
end
