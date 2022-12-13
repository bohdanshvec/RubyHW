# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

author_name_massive = ["Alex", "Bob", "Jon", "Anna", "Janis", "Den", "Wowa", "Alan", "Victor", "Olga"]

10.times do |t|
  name = author_name_massive[t-1]
  Author.create(name: name)
  # author.errors.messages
end