# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Start of seeding'

Game.destroy_all

20.times do
  params = {
    name: Faker::Game.name,
    price: rand(5.00..100.00).round(2).to_s
  }
  game = Game.new(params)
  game.save
  puts "Creating game: #{game.name}"
end

puts 'Seeding over'
