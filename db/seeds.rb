# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def child_category
  category_number = Category.all.sample

  if category_number.has_children?
      puts ">#{category_number.id}<"
      category_number = Category.find(category_number.child_ids.last)
  end
    category_number
end


print "Destroy all elements"
  OrderItem.destroy_all
  Order.destroy_all
  Product.destroy_all
  Category.destroy_all
  Brand.destroy_all
  Delivery.destroy_all
puts ":ok"

print "Create suppliers"
  ['Michelin', 'Goodyear', 'Hankook'].each do |supplier|
    Supplier.create(
        name: supplier
      )
  end
puts ":ok"

print "Create brands"
  ['Sony', 'Kenwood', 'Pioneer'].each do |brand|
    Brand.create(
        name: brand
      )
  end
puts ":ok"

print "Create Category"
scrapbooking = Category.create!(name: "Scrapbooking")
divers = Category.create!(name: "Divers")

dies_embossage = Category.create!(name: "Dies / Embossage", parent: scrapbooking)
embelissements = Category.create!(name: "Embelissements", parent: scrapbooking)
papiers = Category.create!(name: "Papiers", parent: scrapbooking)
pochoirs = Category.create!(name: "Tampons", parent: scrapbooking)

dies = Category.create!(name: "Dies", parent: dies_embossage)
embossage = Category.create!(name: "Plaques embossage", parent: dies_embossage)

alaphabets = Category.create!(name: "Alphabets", parent: embelissements)
badges = Category.create!(name: "Badges", parent: embelissements)
bois = Category.create!(name: "Bois", parent: embelissements)
boutons = Category.create!(name: "Boutons", parent: embelissements)
brads = Category.create!(name: "Brads / Attaches", parent: embelissements)
cabochons = Category.create!(name: "Cabochons en verre", parent: embelissements)
camées = Category.create!(name: "Camées", parent: embelissements)
charms = Category.create!(name: "Charms / Breloques", parent: embelissements)
chipboards = Category.create!(name: "Chipboards", parent: embelissements)
die_cuts = Category.create!(name: "Die-Cuts / Etiquettes / Tags", parent: embelissements)
embelissements_resine = Category.create!(name: "Embelissements résine", parent: embelissements)
embelissements_acryliques = Category.create!(name: "Embelissements acryliques", parent: embelissements)
enamel = Category.create!(name: "Enamel / Dots / Stickers", parent: embelissements)
fleurs = Category.create!(name: "Fleurs", parent: embelissements)
maksing_tape = Category.create!(name: "Masking tape", parent: embelissements)
napperons = Category.create!(name: "Napperons", parent: embelissements)
perles_strass = Category.create!(name: "Perles / strass", parent: embelissements)
trombones_clips = Category.create!(name: "Trombones / Clips", parent: embelissements)

puts ":ok"

puts "Create products"
50.times do
  Product.create(
    name: Faker::Superhero.name,
    sku: rand(1000000),
    state: ['new', 'promotion', 'topsell'].sample,
    category: child_category,
    supplier_id: Supplier.all.sample.id,
    brand_id: Brand.all.sample.id,
    purchasing_price: '',
    coefficient: '',
    discount_rate: '',
    price:  rand(1000),
    weight: rand(100),
    stock: rand(1..9),
    description: Faker::Lorem.paragraphs(3, false),
    home: ['yes', 'no'].sample,
    active: true
    )
  #puts " product #{Product.last.name} is created"
  print "-"
end
puts "50 products are ok"

puts "Create delivery"
  filepath = "db/deliveries_hash.json"
  serialized_deliveries = File.read(filepath)
  deliveries = JSON.parse(serialized_deliveries)

  deliveries.each do |d|
    Delivery.create(
        name: d["name"],
        min_weight: d["min_weight"],
        max_weight: d["max_weight"],
        price: d["price"]
      )
  end
puts "Deliveries created"

print "Create Order Status"
  OrderStatus.delete_all
  OrderStatus.create! id: 1, name: "In Progress"
  OrderStatus.create! id: 2, name: "Placed"
  OrderStatus.create! id: 3, name: "Shipped"
  OrderStatus.create! id: 4, name: "Cancelled"
puts ": ok"
puts "Create Users"
  User.delete_all
  create_account = User.new(email: 'md@md.com', password: '123soleil')
  create_account.save
puts "User #{create_account.email} is created"

