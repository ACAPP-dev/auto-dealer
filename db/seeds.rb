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
Carname.create(name: "Panamera")

ferrari = Make.create(name: "Ferrari")
Carname.create(name: "La Ferrari")
Carname.create(name: "458 Spyder")
Carname.create(name: "F8 Tributo")
Carname.create(name: "FF")
Carname.create(name: "F430")


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
murci.vehicle_search = "2007 Lamborghini Murcielago"
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

ferrari2 =  Vehicle.create(
    year: "2012",
    price: 135980,
    doors: 2,
    body_style: "coupe",
    description: "2012 Ferrari FF in Bianco Avus with 18,679 miles",
    mileage: 18679,
    ext_color: "Bianco Avus",
    int_color: "Nero",
    mileage_city: 11,
    mileage_hwy: 17,
    options: "SPORT DIAMOND FORGED WHEELS ($7555.00), VENTILATED FULL POWER-ADJUSTABLE FRONT SEATS ($7240.00), CARBON FIBER STEERING WHEEL ($4800.00), REAR PARKING CAMERA ($3463.00), FENDER FERRARI SHIELDS ($1590.00), FRONT GRILLE W/CHROME EDGES ($1574.00), PARKING SENSORS ($1494.00), BRAKE CALIPERS IN ALUMINUM GRAY ($1417.00), WHITE TACHOMETER ($916.00), SPORT EXHAUST PIPES ($708.00)")

ferrari.vehicles << ferrari2
ferrari2.carname = Carname.find_by(name: "FF")
ferrari2.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari3.jpg")
ferrari2.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari4.jpg")
ferrari2.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari5.jpg")
ferrari2.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari6.jpg")
ferrari2.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari7.jpg")
ferrari2.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari8.jpg")
ferrari.save
ferrari2.vehicle_search = "2012 Ferrari FF"
ferrari2.save

ferrari3 =  Vehicle.create(
    year: "2007",
    price: 99980,
    doors: 2,
    body_style: "coupe",
    description: "2007 Ferrari F430 in Nurburgring Silver Metallic with 20,254 miles",
    mileage: 20254,
    ext_color: "Nurburgring Silver",
    int_color: "Black",
    mileage_city: 13,
    mileage_hwy: 17,
    options: "DAYTONA STYLE SEATS ($2755.00), LEATHER REAR WALL ($2181.00), HI-FI SOUND SYSTEM ($2063.00), SCUDERIA FERRARI FENDER SHIELDS ($1518.00), REAR PARKING SENSORS ($1114.00), RED BRAKE CALIPERS ($899.00), ALL STITCHING IN COLOR ($321.00), 4 NEW MICHELIN PILOT SPORT 4S TIRES ($1159.96), REAR BREMBO BRAKE PADS & ROTORS JUST REPLACED ($480.23), FRESHLY POWDER COATED REAR WHEELS, INTERIOR DOOR PULLS & BUTTONS REFINISHED (no sticky buttons)")

ferrari.vehicles << ferrari3
ferrari3.carname = Carname.find_by(name: "F430")
ferrari3.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari9.jpg")
ferrari3.photos.build(description: "Thumbnail", link_to_photo: "/images/ferrari10.jpg")
ferrari.save
ferrari3.vehicle_search = "2007 Ferrari F430"
ferrari3.save




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

p2 = Vehicle.create(
    year: "2014",
    price: 129980,
    doors: 2,
    body_style: "coupe",
    description: "2014 Porsche 911 Turbo S in Agate Grey Metallic with 3,665 miles",
    mileage: 3665,
    ext_color: "Agate Gray Metallic",
    int_color: "Espresso/Cognac",
    mileage_city: 17,
    mileage_hwy: 24,
    options: "ADAPTIVE CRUISE CONTROL W/PORSCHE ACTIVE SAFE, BURMESTER HIGH-END SURROUND SOUND-SYSTEM *PRICE TO FOLLOW, ESPRESSO/COGNAC NATURAL LEATHER SEAT TRIM, FIRE EXTINGUISHER, LIGHT DESIGN PACKAGE, MAHOGANY INTERIOR PACKAGE, 
    MAHOGANY MULTIFUNCTION STEERING WHEEL, PORSCHE ENTRY, REAR WIPER, SEAT BELTS IN YACHTING BLUE, SEAT VENTILATION, TELEPHONE MODULE, VOICE CONTROL")

porsche.vehicles << p2
p2.carname = Carname.find_by(name: "911")
p2.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche4.jpg")
p2.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche5.jpg")
p2.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche6.jpg")
porsche.save
p2.vehicle_search = "2014 Porsche 911"
p2.save


p3 = Vehicle.create(
    year: "2018",
    price: 118950,
    doors: 4,
    body_style: "hatchback",
    description: "2018 Porsche Panamera Turbo in Sapphire Blue Metallic with 4,408 miles. This vehicle comes with original books and two keys.",
    mileage: 4408,
    ext_color: "Sappire Blue Metallic",
    int_color: "Black",
    mileage_city: 18,
    mileage_hwy: 25,
    options: "SPORT PACKAGE ($5580.00),ASSISTANCE PACKAGE ($5370.00), PORSCHE DYNAMIC CHASSIS CONTROL SPORT (PDCC SPORT) ($5000.00), PREMIUM PACKAGE PLUS ($2790.00), PANAMERA SPORTDESIGN WHEELS IN EXT COLOR ($3920.00), INTERIOR PACKAGE IN EXTERIOR COLOR ($1170.00), FRONT & REAR PARKASSIST W/SURROUND VIEW ($1200.00), TINTED LED TAILLIGHTS w/ ADAPTIVE BRAKE LIGHTS ($840.00), WINDOW TRIM IN HIGH-GLOSS BLACK ($590.00), AIR OUTLET GRILLES PAINTED IN HIGH-GLOSS BLACK ($570.00), EXTERIOR MIRRORS PAINTED IN HIGH-GLOSS BLACK ($550.00), AMBIENT LIGHTING ($500.00), DOOR HANDLES PAINTED IN HIGH-GLOSS BLACK ($350.00), HEATED STEERING WHEEL ($280.00), MODEL DESIGNATION PAINTED ($220.00), RETRACTABLE LUGGAGE COMPARTMENT COVER ($150.00)")

porsche.vehicles << p3
p3.carname = Carname.find_by(name: "Panamera")
p3.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche7.jpg")
p3.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche8.jpg")
p3.photos.build(description: "Thumbnail", link_to_photo: "/images/porsche9.jpg")
porsche.save
p3.vehicle_search = "2018 Porsche Panamera"
p3.save






# Create Customers

c1 = Customer.create(
    name: "Sharon Lad",
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
    name: "Jessica Zuck",
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
    emp_type: "Service",
    access_level: "100"
)

e2 = Employee.create(
    name: "Andrew Capp",
    address: "1 Ocean View Dr",
    city: "Newport Beach",
    state: "CA",
    zip: "91111",
    email: "andrew@gmail.com",
    password: "1111",
    password_confirmation: "1111",
    phone: "321-321-8888",
    emp_type: "Manager",
    access_level: "300"
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
    emp_type: "Sales",
    access_level: "200"
)

# Create Appointments

d1 = "2020-05-31"
t1 = "15:00"
appt1 = c1.appointments.build(
    appt_type: "sales",
    description: "Test drive lambo",
    appt_date: d1,
    appt_time: t1
)
appt1.employee = e3
appt1.save

d2 = "2020-06-01"
t2 = "17:00"
appt2 = c1.appointments.build(
    appt_type: "sales",
    description: "Check out La Ferrari",
    appt_date: d2,
    appt_time: t2
)
appt2.employee = e3
appt2.save

d3 = Date.new(2020, 6, 15)
t3 = "10:30"

appt3 = c2.appointments.build(
    appt_type: "service",
    description: "Minor Service McLaren 675LT",
    appt_date: d3,
    appt_time: t3
)
appt3.employee = e1
appt3.save
