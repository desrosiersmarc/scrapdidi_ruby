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
  Brand.destroy_all

puts "Create subfamilies"
  ['Scrapboking', 'Tea', 'Coffee'].each do |subfamily|
    Subfamily.create(
      name: subfamily
      )
  end

puts "Create suppliers"
  ['Michelin', 'Goodyear', 'Hankook'].each do |supplier|
    Supplier.create(
        name: supplier
      )
  end

puts "Create brands"
  ['Sony', 'Kenwood', 'Pioneer'].each do |brand|
    Brand.create(
        name: brand
      )
  end

puts "Create products"
i = 0
10.times do
  Product.create(
    name: 'Produit-' + i.to_s,
    sku: rand(1000000),
    state: ['Ok', 'NOK'].sample,
    subfamily_id: Subfamily.all.sample,
    supplier_id: Supplier.all.sample,
    brand_id: Brand.all.sample,
    purchasing_price: '',
    coefficient: '',
    discount_rate: '',
    price:  rand(1000),
    weight: '',
    stock: '',
    description: '',
    )
  i = i +1
end
