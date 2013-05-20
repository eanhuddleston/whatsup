# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
    {email: "user1@gmail.com",
      name: "bobbo",
      password: "testtest", password_confirmation: "testtest",
      address: "2007 Prince ST, Berkeley CA" }, 
    {email: "user2@gmail.com",
      name: "zoolander5",
      password: "testtest", password_confirmation: "testtest",
      address: "342 Howard St, San Francisco, CA" },
    {email: "user3@gmail.com",
      name: "godfather", 
      password: "testtest", password_confirmation: "testtest",
      address: "Evans Hall, UC Berkeley" }
])

users2 = User.create([
    {email: "user4@gmail.com",
      name: "suzy q",
      password: "testtest", password_confirmation: "testtest",
      address: "590 W. 26th ST, Eugene OR" },
    {email: "demo@demo.com",
      name: "demo",
      password: "demodemo", password_confirmation: "demodemo",
      address: "2007 Prince ST, Berkeley, CA" }
])

categories = Category.create([
    {name: "Street Fair"}, #1
    {name: "Live Music"}, #2
    {name: "Happy Hour"}, #3
    {name: "Garage Sale"}, #4
    {name: "Festival"}, #5
    {name: "Art"}, #6
    {name: "General"} #7
])

events = Event.create([
    {title: "Open Mic Night at The Starry Plough Pub",
      description: "Come and hear some great Irish music.",
      datetime: DateTime.now + 3.days + 5.hours,
      address: "5612 College Avenue, Oakland, CA 94618",
      category_ids: [2]},
    {title: "Berkeley International Kite Festival",
      description: "Kite making, contests, exhibitions and kite dancing.",
      datetime: DateTime.now + 5.days + 5.hours,
      address: "Cesar Chavez Park, Berkeley, CA",
      category_ids: [5]},
    {title: "Garage Sale",
      description: "Lots of really cool stuff you won't want to miss.",
      datetime: DateTime.now + 4.days + 9.hours,
      address: "1340 Hopkins St, Berkeley, CA",
      category_ids: [4]},
    {title: "Happy Hour at The Albatross Pub",
      description: "Come enjoy some cheap drinks great atmosphere.",
      datetime: DateTime.now + 2.days + 12.hours,
      address: "1822 San Pablo Avenue, Berkeley, CA 94710",
      category_ids: [3]},
    {title: "Museum Grand Opening",
      description: "See some neato stuff.",
      datetime: DateTime.now + 6.days + 12.hours,
      address: "1500 Leimert Boulevard, Oakland, CA 94602",
      category_ids: [7]},
    {title: "San Francisco Art Street Fair",
      description: "Come experience the lively art that San Fran has to offer.",
      datetime: DateTime.now + 6.days + 12.hours,
      address: "160 Folsom ST, San Francisco, CA",
      category_ids: [1]},
    {title: "Happy Hour at The Snug",
      description: "Come enjoy a bevy of beverages.",
      datetime: DateTime.now + 1.days + 12.hours,
      address: "33 29th Street San Francisco, CA 94110",
      category_ids: [3]}
])

comments = Comment.create([
    {text: "Wow, looking forward to it!",
      event_id: 1,
      user_id: 1},
    {text: "Very cool",
      event_id: 1,
      user_id: 2},
    {text: "Can't wait",
      event_id: 1,
      user_id: 3},
    {text: "Will be the best event ever",
      event_id: 1,
      user_id: 4},
    {text: "Oh joy",
      event_id: 1,
      user_id: 1}
])

reservations = Reservation.create([
    {event_id: 1,
      user_id: 1},
    {event_id: 1,
      user_id: 2},
    {event_id: 1,
      user_id: 3},
    {event_id: 1,
      user_id: 4}
])


# DateTime.new(2013,7,27,16,0,0)