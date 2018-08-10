# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

ingredients = JSON.parse RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients["drinks"].each {|ingredient| Ingredient.create!(name: ingredient["strIngredient1"])}

names = ["Daiquiri", "Hot Toddy", "Espresso Martini", "Fuzzy Navel", "Ti Punch", "Tom & Jerry", "Breakfast Martini", "Flip", "Wassail", "Eggnog", "Shrub", "Porchscrawler"]

images = [
"https://realfood.tesco.com/media/images/164-FrozenStrawberryDaiquiris-LH-d53ca5a4-f31b-471c-8777-452fa090bbba-0-1400x919.jpg",
"https://assets.epicurious.com/photos/5761c7f08accf290434553a2/master/pass/hot-toddy.jpg",
"https://www.dilettante.com/resize/images/cafe/MenuMartini/Midnight-Espresso-Martini.jpg?bw=575&w=575",
"https://cdn.cdkitchen.com/recipes/images/2016/04/88026-5665-mx.jpg",
"https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/591c54d3e1a6e.jpeg",
"https://cdn-image.foodandwine.com/sites/default/files/styles/medium_2x/public/2012-cocktails-xl-tom-and-jerry.jpg?itok=ICKXREj_",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK8EeYW2fuTsNa58uGvBhFCJDpX__Xx6h_MXA8eXEOqyjfSP0A",
"https://www.macheesmo.com/wp-content/uploads/2017/11/Rum-Flip-Cocktail.jpg",
"https://cdn.cdkitchen.com/recipes/images/2016/12/110234-7039-mx.jpg",
"https://www.seriouseats.com/2017/12/20171101-eggnog-vicky-wasik-1-1500x1125.jpg",
"https://d1doqjmisr497k.cloudfront.net/-/media/mccormick-us/recipes/gourmet/p/800/pickled-watermelon-shrub-cocktail.ashx?vd=20180710T023609Z&hash=EBDBF63C44352D6AC5B1BA14139129D3F55BAF74",
"https://cdn.shopify.com/s/files/1/0021/7494/3287/products/paumaui_recipes_pau-loma_800x.jpg?v=1525458686"
]



names.each_with_index do |name, index|
  cocktail = Cocktail.create!(
    name: name,
    rating: rand(4),
    img_url: images[index]
    )
  [3,4].sample.times do
    cocktail.doses.create!(ingredient: Ingredient.all.sample, description: ["A lot!", "5cl", "Just one Drop", "As you like"].sample)
  end
  [3,4,5].sample.times do
    cocktail.reviews.create!(content: Faker::Lorem.sentence(rand(7)+5) ,rating:rand(3)+1)
  end
end

