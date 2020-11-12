# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
# require 'open-uri'

# Ingredient.destroy_all if Rails.env.development?
puts "start"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

Ingredient.destroy_all if Rails.env.development?

# Actually fetch the contents of the remote URL as a String.
buffer = open(url).read

ingredients = JSON.parse(buffer)

ingredients['drinks'].each do |ingredient|
  # Ingredient.create!(name: ingredient["strIngredient1"])
  puts ingredient["strIngredient1"]
end
