# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Bench.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('users')

  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
      username: 'Demo-lition', 
      email: 'demo@user.io', 
      password: 'password'
    )
  
    # More users
    10.times do 
      User.create!({
        username: Faker::Internet.unique.username(specifier: 3),
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end

    puts "Creating benches..."
    Bench.create!({
      title: 'App Academy Bench',
      description: '2nd floor bench at App Academy',
      price: 120,
      seating: 6,
      lat: 40.73668,
      lng: -73.99289
    })
    Bench.create!({
      title: 'Union Square',
      description: 'Main benches at Union Square',
      price: 20,
      seating: 10,
      lat: 40.735322520499544,
      lng: -73.99093299152008,
    })
    Bench.create!({
      title: 'Yankee Stadium Overlook',
      description: 'Beatiful View of the Game',
      price: 150,
      seating: 8,
      lat: 40.83009191985383,
      lng: -73.92439641745122
    })
    Bench.create!({
      title: 'Brooklyn Bridge',
      description: 'Bench on Brooklyn Bridge',
      price: 100,
      seating: 4,
      lat: 40.70617132594168,
      lng: -73.99657436481905
    })
    Bench.create!({
      title: 'Central Park',
      description: 'Great Lawn Seating',
      price: 90,
      seating: 6,
      lat: 40.78262373155203,
      lng: -73.96546002003545
    })
    Bench.create!({
      title: 'Prospect Park',
      description: 'Bench on the Dog Beach',
      price: 200,
      seating: 12,
      lat: 40.66290434273481,
      lng: -73.97123642366297
    })
  
    puts "Done!"

  end