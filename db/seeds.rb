# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



99.times do |n|
  name    = Faker::Pokemon.name
  email   = "example-#{n}@manuel.uoo"
  expert  = rand(2).zero?

  case rand(3)
  when 0 then status = true
  when 1 then status = false
  when 2 then status = nil
  end

  User.create!( 
    username: name, 
    email: email,
    password: "password",
    password_confirmation: "password",
    expert: expert,
    status: status)
end