require 'json'
require 'open-uri'

puts "Cleaning database..."
Ingredient.destroy_all

puts "Creating Ingredients..."

  url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
  user_serialized = open(url).read
  user = JSON.parse(user_serialized)

  user['drinks'].each do |ingredient|
    Ingredient.create!(name: ingredient['strIngredient1'])
    puts "#{ingredient['strIngredient1']}"
  end

puts "Finished!"
