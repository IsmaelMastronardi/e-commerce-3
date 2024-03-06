# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


["computers", "phones", "refrigerators", "washing machines", "televisions"].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

["sony", "samsung", "lg", "whirlpool", "apple", "dell", "hp", "lenovo"].each do |brand_name|
  Brand.find_or_create_by!(name: brand_name)
end

# Create products with Faker data
10.times do
  category = Category.all.sample
  brand = Brand.all.sample

  product_params = {
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 50..1000.0),
    available_amount: Faker::Number.between(from: 1, to: 100),
    image: Faker::Internet.url,
    category_id: category.id,
    brand_id: brand.id
  }

  product_details_params = {
    description: Faker::Lorem.paragraph,
    short_description: Faker::Lorem.sentence,
    specifications: Faker::Lorem.sentences(number: 3).join(' '),
    characteristics: Faker::Lorem.sentences(number: 3).join(' '),
    color: Faker::Color.color_name
  }

  product = Product.create!(product_params)
  product.create_product_detail(product_details_params)
end

# {
#   "product": {
#       "atributes": {
#           "name": "some product 1",
#           "price": 100,
#           "available_amount": 10,
#           "image": "some_image_url",
#           "category_id": "2",
#           "brand_id": "2"
#       },
#       "product_details": {
#           "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
#           "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
#           "specifications": "there will be specifications",
#           "characteristics": "there will be characteristics",
#           "color": "black"
#       }
#   }
# }

