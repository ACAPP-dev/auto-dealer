# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Makes & Models

porsche = Make.create(name: "Porsche")
Carname.create(name: "911")
Carname.create(name: "Macan")
Carname.create(name: "918 Boxter")

ferrari = Make.create(name: "Ferrari")
Carname.create(name: "La Ferrari")
Carname.create(name: "458 Spyder")
Carname.create(name: "F8 Tributo")

lambo = Make.create(name: "Lamborghini")
Carname.create(name: "Murcielago")
Carname.create(name: "Aventador SVJ")
Carname.create(name: "Huracon")

# Create Vehicles

murci = Vehicle.create(
    year: "2007",
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
murci.vehicle_search = "2007 Lamborghini Murcielage"
murci.save

ferrari1 =  Vehicle.create(
    year: "2014",
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
ferrari1.vehicle_search = "2014 Ferrari La Ferrari"
ferrari1.save

avent = Vehicle.create(
    year: "2019",
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
avent.vehicle_search = "2019 Lamborghini Aventador SVJ"
avent.save

p1 = Vehicle.create(
    year: "1997",
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
p1.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche.jpg")
p1.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche2.jpg")
p1.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche3.jpg")
porsche.save
p1.vehicle_search = "1997 Porsche 911"
p1.save

# Create Customers

c1 = Customer.create(
    name: "Sharon Li",
    address: "3451 W. 35th Street",
    city: "Los Angeles",
    state: "CA",
    zip: "92445",
    email: "sharon@hotmail.com",
    password: "1111",
    password_confirmation: "1111",
    phone: "445-567-7666"
)

c2 = Customer.create(
    name: "Amber Burns",
    address: "591 S Casita St",
    city: "Anaheim",
    state: "CA",
    zip: "92805",
    email: "amber123@gmail.com",
    password: "1111",
    password_confirmation: "1111",
    phone: "636-244-2431"
)

c3 = Customer.create(
    name: "Jessica Zhang",
    address: "451 W 235 St, Apt #515",
    city: "Baltimore",
    state: "MD",
    zip: "11234",
    email: "jessica@gmail.com",
    password: "1111",
    password_confirmation: "1111",
    phone: "123-456-7899"
)

# Create Employees

e1 = Employee.create(
    name: "Ed Sheeran",
    address: "2455 West Los Angeles Blvd",
    city: "Pico Rivera",
    state: "CA",
    zip: "92735",
    email: "ed@123.com",
    password: "1111",
    password_confirmation: "1111",
    phone: "444-444-4444",
    emp_type: "service",
    access_level: "10"
)

e2 = Employee.create(
    name: "Andrew Capp",
    address: "1 Ocean View Dr",
    city: "Newport Beach",
    state: "CA",
    zip: "91111",
    email: "andrew@gmail.com",
    password: "1234",
    password_confirmation: "1234",
    phone: "321-321-8888",
    emp_type: "manager",
    access_level: "100"
)

e3 = Employee.create(
    name: "Joshua Kemp",
    address: "5623 S Pacific Coast Hwy",
    city: "Laguna Beach",
    state: "CA",
    zip: "92832",
    email: "josh@gmail.com",
    password: "1111",
    password_confirmation: "1111",
    phone: "666-666-6666",
    emp_type: "sales",
    access_level: "50"
)

# Create Appointments

d1 = Date.new(2020, 5, 31)
t1 = Time.new(2020, 5, 31, 15, 00, 00)
appt1 = c1.appointments.build(
    appt_type: "sales",
    description: "Test drive lambo",
    appt_date: d1,
    appt_time: t1
)
appt1.employee = e3
appt1.save


t2 = Time.new(2020, 5, 31, 17, 00, 00)
appt2 = c1.appointments.build(
    appt_type: "sales",
    description: "Check out La Ferrari",
    appt_date: d1,
    appt_time: t2
)
appt2.employee = e3
appt2.save

d2 = Date.new(2020, 6, 15)
t3 = Time.new(2020, 6, 15, 10, 30, 00)

appt3 = c2.appointments.build(
    appt_type: "service",
    description: "Minor Service McLaren 675LT",
    appt_date: d2,
    appt_time: t3
)
appt3.employee = e1
appt3.save

# Create Vehicle Purchases (todo)
# Create Vehicle Sales (todo)