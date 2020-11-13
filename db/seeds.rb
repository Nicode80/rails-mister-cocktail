# ingredients

require 'open-uri'

# Ingredient.destroy_all if Rails.env.development?
puts "start"

puts"create ingredients"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

Ingredient.destroy_all if Rails.env.development?

puts 'buffer'
# Actually fetch the contents of the remote URL as a String.
buffer = open(url).read
puts 'JSON'
ingredients = JSON.parse(buffer)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

#cocktails

puts"create cocktails"

Cocktail.destroy_all if Rails.env.development?


margarita_pic = URI.open('https://images.unsplash.com/photo-1590701833281-e6283af0948d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80')
mojito_pic = URI.open('https://images.unsplash.com/photo-1550850584-455a131629e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2076&q=80')


margarita = Cocktail.new(name: "Margarita")
margarita.photo.attach(io: margarita_pic, filename: 'margarita.jpeg', content_type: 'image/jpeg')
margarita.save

mojito = Cocktail.create!(name: "Mojito")
mojito.photo.attach(io: mojito_pic, filename: 'mojito.jpeg', content_type: 'image/jpeg')
mojito.save

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

puts"create doses"

Dose.destroy_all if Rails.env.development?

Dose.create(description: cl, cocktail: margarita, ingredient: tequila)
Dose.create(description: cl, cocktail: margarita, ingredient: triple_sec)
Dose.create(description: cl, cocktail: margarita, ingredient: lime_juice)

#Mojito
Dose.create(description: cl, cocktail: mojito, ingredient: rhum)
Dose.create(description: cl, cocktail: mojito, ingredient: lime_juice)
Dose.create(description: spoon, cocktail: mojito, ingredient: sugar)
Dose.create(description: some, cocktail: mojito, ingredient: carb_water)
