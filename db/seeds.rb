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
ferrari.carnames.build(name: "458 Spyder")
ferrari.carnames.build(name: "F8 Tributo")
ferrari.save

lambo = Make.create(name: "Lamborghini")
lambo.carnames.build(name: "Murcielago")
lambo.carnames.build(name: "Aventador SVJ")
lambo.carnames.build(name: "Huracon")
lambo.save

# Create Vehicles

murci = Vehicle.create(
    year: 2007,
    price: 199970,
    doors: 2,
    body_style: "coupe",
    description: "Amazing low mileage Lambo with lots of options.",
    mileage: 5229,
    ext_color: "black",
    int_color: "black",
    mileage_city: 9,
    mileage_hwy: 14,
    options: "6-SPEED SEQUENTIAL TRANSMISSION ($10000.00), TRANSPARENT ENGINE COVER ($7020.00), CARBON FIBER INTERIOR PACKAGE ($6500.00), HERMERA WHEELS ($4030.00), INTERIOR Q-CITURA ($2100.00), COLORED BRAKE CALIPERS ($805.00), BRANDING PACKAGE ($650.00), COLORED BADGE FOR WHEELS ($270.00)")

lambo.vehicles << murci 
murci.carname = Carname.find_by(name: "Murcielago")
murci.photos.build(description: "Thumbnail", link_to_photo: "/images/murci.jpg")
murci.photos.build(description: "Thumbnail", link_to_photo: "/images/murci2.jpg")
lambo.save
murci.save

ferrari1 =  Vehicle.create(
    year: 2014,
    price: 3495000,
    doors: 2,
    body_style: "coupe",
    description: "Collecter model with only 333 miles",
    mileage: 333,
    ext_color: "Rosso Corsa",
    int_color: "Rosso",
    mileage_city: 7,
    mileage_hwy: 12,
    options: "bluetooth, leather seats, backup camera, alloy wheels")

ferrari.vehicles << ferrari1
ferrari1.carname = Carname.find_by(name: "La Ferrari")
ferrari1.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari.jpg")
ferrari1.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari2.jpg")
ferrari.save
ferrari1.save

avent = Vehicle.create(
    year: 2019,
    price: 559900,
    doors: 2,
    body_style: "coupe",
    description: "New - never registered",
    mileage: 19,
    ext_color: "white",
    int_color: "saddle brown",
    mileage_city: 7,
    mileage_hwy: 12,
    options: "Carbon fiber package, appearance package, personalized stitching")

lambo.vehicles << avent
avent.carname = Carname.find_by(name: "Aventador SVJ")
avent.photos.build(description: "Thumbnail", link_to_photo: "/images/avent.jpg")
avent.photos.build(description: "Thumbnail", link_to_photo: "/images/avent2.jpg")
lambo.save
avent.save

p1 = Vehicle.create(
    year: 1997,
    price: 795900,
    doors: 2,
    body_style: "coupe",
    description: "911 Turbo S with only 500 miles.  One of only 183 built, and almost certainly the ONLY Turbo S in this color combination!",
    mileage: 532,
    ext_color: "Wimbledon Green Metallic",
    int_color: "Nephrite Green",
    mileage_city: 15,
    mileage_hwy: 18,
    options: "424Hp twin turbo H6, 6 Speed manual transmission, RARE rear seat delete with storage compartments, Porsche crest embossed in headrests, 8 way powered and heated seats, full leather interior (nearly everything covered in leather from the door sills to the headliner), full interior carbon fiber package, carbon fiber and leather steering wheel, carbon fiber shifter and handbrake handles, CD player, rear wiper, Aerokit II body kit and spoiler, floor mats in black with Porsche logos, 5 CD holders in center console, yellow brake calipers, metallized finish wheels")

porsche.vehicles << p1
p1.carname = Carname.find_by(name: "911")
porsche.save
p1.save

# Link photos


