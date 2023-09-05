# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding"
Member.create!(name: 'Bob', company: 'Le Wagon', title: 'Designer', email: 'bob@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Beth', company: 'Le Wagon', title: 'Performance', email: 'beth@lewagon.com', capacity: 8, line_manager: 'Wade')

puts "Seeded"
