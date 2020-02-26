# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "Cleaning the database..."
User.destroy_all

puts "Creating users..."

User.create!([
  { email: 'maxim@gmail.com',
    password: 'kjguo80438dg',
    first_name: 'Maxim',
    last_name: 'van Hoorn'
  },
  { email: 'iris@gmail.com',
    password: 'jnfbodi498y34',
    first_name: 'Iris',
    last_name: 'van Dijken'
  },
])

puts "You have #{User.count} users"

puts "Creating cars..."

Car.destroy_all
10.times do
  car = Car.new(
    user: User.all.sample,
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: rand(2000..2020),
    price: rand(50..500),
    number_of_seats: rand(2..8),
    registration_number: Faker::Vehicle.license_plate,
    transmission: ['manual', 'automatic'].sample
  )
  # photo = ['carphotos/orange.jpg', 'carphotos/white.jpg', 'carphotos/yellow.jpg', 'carphotos/grey.jpg', 'carphotos/red.jpg']
  # car.photo.attach(io: file, filename: `#{photo.sample}`, content_type: 'image/jpg')

  car.save
end

puts "You have #{Car.count} cars"

