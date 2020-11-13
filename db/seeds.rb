# ingredients

require 'open-uri'

# Ingredient.destroy_all if Rails.env.development?
puts "start"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

Ingredient.destroy_all if Rails.env.development?

# Actually fetch the contents of the remote URL as a String.
buffer = open(url).read

ingredients = JSON.parse(buffer)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

#cocktails
margarita = Cocktail.create!(name: "Margarita")
mojito = Cocktail.create!(name: "Mojito")

#ingredients
rhum = Ingredient.find_by(name: "Rum")
lime_juice = Ingredient.find_by(name: "Lime juice")
carb_water = Ingredient.find_by(name: "Carbonated water")
sugar = Ingredient.find_by(name: "Sugar")
tequila = Ingredient.find_by(name: "Tequila")
triple_sec = Ingredient.find_by(name: "Triple sec")

#doses
cl = "5 cl"
spoon = "1 coffee spoon"
some = "some"

#Margarita
Dose.create(description: cl, cocktail: margarita, ingredient: tequila)
Dose.create(description: cl, cocktail: margarita, ingredient: triple_sec)
Dose.create(description: cl, cocktail: margarita, ingredient: lime_juice)

#Mojito
Dose.create(description: cl, cocktail: mojito, ingredient: rhum)
Dose.create(description: cl, cocktail: mojito, ingredient: lime_juice)
Dose.create(description: spoon, cocktail: mojito, ingredient: sugar)
Dose.create(description: some, cocktail: mojito, ingredient: carb_water)
