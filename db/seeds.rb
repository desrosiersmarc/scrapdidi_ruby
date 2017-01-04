# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy all elements"
  Cart.destroy_all
  Product.destroy_all
  Subfamily.destroy_all

puts "Create subfamilies"
  ['Scrapboking', 'Tea', 'Coffee'].each do |subfamily|
    Subfamily.create(
      name: subfamily
      )
  end

puts "Create suppliers"

puts "Create brands"

puts "Create products"

10.times do
  Product.create(
    name: 'Produit-' + i.to_S,
    sku: rand(1000000),
    state: ['Ok', 'NOK'].sample,
    subfamily_id: '',
    supplier_id: '',
    brand_id: '',
    purchasing_price: '',
    coefficient: '',
    discount_rate: '',
    price:  '',
    weight: '',
    stock: '',
    description: '',
    )
  i = i +1
end
