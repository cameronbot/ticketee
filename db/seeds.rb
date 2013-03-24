# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_user = User.create(:email => "admin@ticketee.com", :password => "password")
admin_user.admin = true
admin_user.confirm!

Project.create(:name => "Ticketee Beta")

State.create([
  { name: "New", background: "#85ff00", color: "white", default: true },
  { name: "Open", background: "#00cffd", color: "white" },
  { name: "Closed", background: "#000", color: "white" }
], :without_protection => true)
