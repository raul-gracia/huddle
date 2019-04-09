# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Topic.destroy_all
%w( Rails Ruby CSS Heroku Javascript React React\ Native  ).each do |topic|
  Topic.create!(name: topic)
end


Event.destroy_all
Event.create!(
  name:       'Barcelona Ruby User Group',
  date:       10.days.from_now,
  start_time: '18:00',
  end_time:   '20:00',
  address:    'Carrer de Pujades, 176',
  postcode:   '08005',
  city:       'Barcelona',
  country:    'Spain',
  topics:     Topic.all.first(2)
)

Event.create!(
  name:       'Javascript Meetup',
  date:       1.month.from_now,
  start_time: '21:00',
  end_time:   '21:30',
  address:    'Carrer de Muntaner, 237',
  postcode:   '08021',
  city:       'Barcelona',
  country:    'Spain',
  topics:     Topic.all.last(3)
)

User.destroy_all
u = User.create!(email: 'user@example.com', password: '123456', name: 'User')


SavedSearch.destroy_all
u.saved_searches.create(name: 'Barcelona Js', city: 'Barcelona', start_time: '18:00', end_time: '21:00', topics: [Topic.find_by(name: 'Javascript')])
u.saved_searches.create(name: 'Madrid.rb', city: 'Madrid', start_time: '17:00', end_time: '23:00', topics: [Topic.find_by(name: 'Ruby'), Topic.find_by(name: 'Rails')])

