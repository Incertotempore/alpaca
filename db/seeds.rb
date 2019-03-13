# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts 'Cleaning database...'
  User.destroy_all
  Item.destroy_all
  Deal.destroy_all

puts 'Creating Users...'
5.times do
  new_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: "123456"
    )
  new_user.save
  puts "#{new_user} - #{new_user.first_name} #{new_user.last_name} has been created as a #{new_user.valid?} user."
end

italy = ['52 Corso Magenta, Milan', 'Piazza Duomo, Milan', 'Via Ariberto, Milan', 'Via Torino, Milan', '12, via Crema, Milan']

puts 'Creating Items...'
10.times do
  new_item = Item.new(
    category: ["clothe", "car", "tool", "machine"].sample,
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.paragraphs(1, true),
    picture: "",
    user_id: User.all.sample.id,
    address: Faker::Address.city
    )
  new_item.save
  puts "#{new_item} - #{new_item.name} has been created as a #{new_item.valid?} item."
end

puts "Creating Deals..."
5.times do
  new_deal = Deal.new(
    date_start: Date.today, #Faker::Date.between(200.days.ago, 100.days.ago),
    date_end: Date.today, #Faker::Date.between(100.days.ago, Date.today),
    user_id: User.all.sample.id,
    item_id: Item.all.sample.id
    )
  new_deal.save
  puts "#{new_deal} from #{new_deal.date_start} to #{new_deal.date_end} has been created as a #{new_deal.valid?} deal."
end

puts "Creating Reviews..."
5.times do
  new_review = Review.new(
    rating: rand(1..5),
    comment: Faker::Lorem.paragraphs(2, true),
    item_id: Item.all.sample.id,
    user_id: User.all.sample.id
    )
  new_review.save
  puts "#{new_review} with rating #{new_review.rating} has been created as a #{new_review.valid?} review."
end

