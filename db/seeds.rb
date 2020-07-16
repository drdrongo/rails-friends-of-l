# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Clearing database...'
Ticket.destroy_all
Event.destroy_all
User.destroy_all
puts 'Database Cleared.'

def create_users
  10.times do
    user = User.new(
      name: Faker::Name.unique.first_name,
      email: Faker::Internet.unique.safe_email,
      password: Faker::Internet.password(min_length: 10, max_length: 20),
    )
    user.save
    create_events(user)
  end
end

def create_events(user)
  1.times do
    event = Event.new(
      title: Faker::Verb.ing_form,
      description: "A bit long description of my great event! It'll be great!",
      datetime: rand(Time.zone.now .. 4.days.from_now),
      venue: Faker::Restaurant.name,
      capacity: rand(2..8),
      category: Faker::Restaurant.type
    )
    event.user = user
    event.save
    3.times do
      ticket = Ticket.new(
        event: event,
        user: User.all.to_a.reject!{ |u| u == event.user}.sample
      )
      ticket.save
    end
  end
end

puts 'Creating users, events, and tickets...'
create_users
puts 'Seeding completed. Have a nice day.'

