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