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

puts 'Creating 10 new users...'
puts '10 users created.'

puts 'Creating 10 new events...'
puts '10 events created.'

puts 'Seeding completed. Have a nice day.'


def create_users
  10.times do
    user = User.new(
      email: ,
      encrypted_password: ,
    )
    user.save
  end
end

def create_events
  10.times do
    event = Event.new(
      title: ,
      description: ,
      datetime: ,
      venue: ,
      capacity: ,
      category:
    )
    event.save
  end
end

def create_tickets
  10.times do
    ticket = Ticket.new(
      user_id: ,
      event_id:
    )
    ticket.save
  end
end



