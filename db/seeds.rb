# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Dose.delete_all
Cocktail.delete_all
Ingredient.delete_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
page = open(url).read
content = JSON.parse(page)
ingredients = content["drinks"]

# p ingredients.values.sort

array = ingredients.map do |hash|
  hash["strIngredient1"]
end.sort

array.each do |ingredient|
  Ingredient.create(name: ingredient)
end




