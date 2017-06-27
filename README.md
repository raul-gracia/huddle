# Huddle

![Events List](/screenshot-events.png?raw=true "Events List")
![Saved Searches](/screenshot-searches.png?raw=true "Saved Searches")


## Setup

Clone this repo and run

`bin/setup`

## Requirements

- Ruby 2.4.1
- Rails 5.1.1
- Postgresql

##  Tests

to run the tests:

`bundle exec rspec`


### To create a new event that will trigger a new mail notification

Log in with username `user@example.com` and password `123456`

Then run this command:

```
be rails runner "Event.create!(name: 'Event', date: Date.today, start_time: '20:00', end_time: '21:00', city: 'Madrid', address: 'address', postcode: '50000', country: 'Spain', topics: [Topic.find_by(name: 'Ruby'), Topic.find_by(name: 'Rails'])"
```
