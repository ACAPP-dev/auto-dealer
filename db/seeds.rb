# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Makes & Models

porsche = Make.create(name: "Porsche")
porsche.carnames.build(name: "911")
porsche.carnames.build(name: "Macan")
porsche.carnames.build(name: "918 Boxter")
porsche.save

ferrari = Make.create(name: "Ferrari")
ferrari.carnames.build(name: "La Ferrari")
ferrari.save