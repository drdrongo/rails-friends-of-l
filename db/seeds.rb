puts 'Clearing database...'
Ticket.destroy_all
Event.destroy_all
User.destroy_all
puts 'Database Cleared.'

def create_users
  10.times do
    user = User.new(
      first_name: Faker::Name.unique.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.safe_email,
      password: Faker::Internet.password(min_length: 10, max_length: 20),
      description: "This is a great description of my personality! I'm a great person!",
      birthday: rand(52.years.ago .. 20.years.ago)
    )
    file = URI.open("https://i.pravatar.cc/500")
    user.photo.attach(io: file, filename: "#{user.first_name}_#{user.last_name}.png", content_type: 'image/png')
    if user.save
      puts "User #{user.first_name} created"
    end
    create_events(user)
  end
end

def create_events(user)
  1.times do
    event = Event.new(
      title: "#{Faker::Food.dish} with friends",
      description: "A bit of a long description of my great event! It'll be great!",
      datetime: rand(Time.zone.now .. 4.days.from_now),
      venue: Faker::Restaurant.name,
      capacity: rand(2..8),
      category: Faker::Restaurant.type,
    )
    file = URI.open("https://source.unsplash.com/featured/?japanese/food&#{rand(10000)}")
    event.photo.attach(io: file, filename: "#{event.title}.png", content_type: 'image/png')
    event.end_time = event.datetime + rand(1..3).hours
    event.user = user
    event.save
    unused_users = User.all.to_a.reject!{ |u| u == event.user}
    6.times do
      ticket = Ticket.new(
        event: event,
        user: unused_users.sample
      )
      unused_users.delete(ticket.user)
      ticket.status = ['pending', 'accepted'].sample
      ticket.save
    end
  end
end

puts 'Creating users, events, and tickets...'
create_users
puts 'Seeding completed. Have a nice day.'

