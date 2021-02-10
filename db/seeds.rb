# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dcd.create([
  { first_name: "Mary", last_name: "Mac", birthday: Date.today, deathday: Date.today },
  { first_name: "Josh", last_name: "Mac", birthday: Date.today, deathday: Date.today },
  { first_name: "Voldemort", last_name: "Marvolo", birthday: Date.today, deathday: Date.today },
  { first_name: "Albus", last_name: "Dumbledore", birthday: Date.today, deathday: Date.today },
  ])