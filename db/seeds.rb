# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
      {email: "user1@gmail.com", 
        password: "testtest", password_confirmation: "testtest",
        address: "2007 Prince ST, Berkeley CA" }, 
      {email: "user2@gmail.com", 
        password: "testtest", password_confirmation: "testtest",
        address: "160 Folsom ST, San Francisco" },
      {email: "user3@gmail.com", 
        password: "testtest", password_confirmation: "testtest",
        address: "Evans Hall, UC Berkeley" }
      ])

events = Event.create([
      {title: "Open Mic Night at The Starry Plough Pub",
        description: "Come and hear some great Irish music.",
        datetime: DateTime.now + 3.days + 5.hours,
        address: "5612 College Avenue, Oakland, CA 94618"},
      {title: "Berkeley International Kite Festival",
        description: "Kite making, contests, exhibitions and kite dancing.",
        datetime: DateTime.now + 5.days + 5.hours,
        address: "Cesar Chavez Park, Berkeley, CA"},
      {title: "Garage Sale",
        description: "Lots of really cool stuff you won't want to miss.",
        datetime: DateTime.now + 4.days + 9.hours,
        address: "1340 Hopkins St, Berkeley, CA"},
      {title: "Happy Hour at The Albatross Pub",
        description: "Come enjoy some cheap drinks great atmosphere.",
        datetime: DateTime.now + 2.days + 12.hours,
        address: "1822 San Pablo Avenue, Berkeley, CA 94710"},
      {title: "Museum Grand Opening",
        description: "See some neato stuff.",
        datetime: DateTime.now + 6.days + 12.hours,
        address: "1500 Leimert Boulevard, Oakland, CA 94602"}
      ])

# DateTime.new(2013,7,27,16,0,0)