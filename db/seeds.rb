# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "Cleaning the database..."
Request.destroy_all
Car.destroy_all
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
    location: Faker::Address.city,
    start_date: Date.yesterday,
    end_date: Date.today,
    year: rand(2000..2020),
    price: rand(50..500),
    number_of_seats: rand(2..8),
    registration_number: Faker::Vehicle.license_plate,
    transmission: ['manual', 'automatic'].sample
  )
  photo_url = ['https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80', 'https://images.unsplash.com/photo-1541443131876-44b03de101c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80', 'https://images.unsplash.com/photo-1506671753197-8d137cc5d53c?ixlib=rb-1.2.1&auto=format&fit=crop&w=740&q=80', 'https://images.unsplash.com/photo-1502877338535-766e1452684a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80', 'https://images.unsplash.com/photo-1489824904134-891ab64532f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1778&q=80'].sample
  file = URI.open(photo_url)
  car.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

  car.save
end

puts "You have #{Car.count} cars"

