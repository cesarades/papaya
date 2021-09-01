require 'faker'
require 'open-uri'

##################################
#####    Seed The Program    #####
##################################
LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
puts "---------------------------------------------"
puts "Cleaning database..."
User.delete_all
Event.delete_all
Booking.delete_all
puts "🎉 Success!"
puts "---------------------------------------------"

#################################
#####     Helper Method     #####
#################################

def attach_photo(object, url)
  file = URI.open(url)
  object.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')
end

###################################
#####     Creates Users       #####
###################################
puts "---------------------------------------------"
puts "Creating users..."

helen = User.create(email: Faker::Internet.email,
                    password: 'password',
                    first_name: 'Helen',
                    last_name: 'Heart',
                    organization: false,
                    bio: Faker::Movies::PrincessBride.quote,
                    age: 21,
                    gender: 'female',
                    religion: 'athiest')
attach_photo(helen, 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80')

oxfam = User.create(email: Faker::Internet.email,
                    password: 'password',
                    company_name: 'Oxfam',
                    organization: true,
                    bio: Faker::Movies::PrincessBride.quote)
attach_photo(oxfam, 'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80')

puts "🎉 Success, users created!"
puts "---------------------------------------------"

###################################
#####     Creates Events      #####
###################################

puts "---------------------------------------------"
puts "Creating events..."

cooking = Event.create!(capacity: rand(1..20),
                        description: Faker::Movies::PrincessBride.quote,
                        category: "Food",
                        recurrence_times: rand(1..4),
                        recurrence_frequency: ['days', 'weeks', 'months'].sample,
                        address: Faker::Address.full_address,
                        latitude: Faker::Address.latitude,
                        longitude: Faker::Address.longitude,
                        start_time: DateTime.now + (1.0 / 24.0),
                        end_time: DateTime.now + (2.0 / 24.0),
                        name: "Cook Together",
                        user: oxfam)
attach_photo(cooking, 'https://images.unsplash.com/photo-1604332790652-b431be0cf9af?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29va2luZyUyMHNjaG9vbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')

food_kitchen = Event.create(capacity: rand(1..20),
                            description: Faker::Movies::PrincessBride.quote,
                            category: ["Food", "Shelter"],
                            recurrence_times: rand(1..4),
                            recurrence_frequency: ['days', 'weeks', 'months'].sample,
                            address: Faker::Address.full_address,
                            latitude: Faker::Address.latitude,
                            longitude: Faker::Address.longitude,
                            start_time: DateTime.now + (1.0 / 24.0),
                            end_time: DateTime.now + (2.0 / 24.0),
                            name: "Food Kitchen",
                            user: oxfam)
attach_photo(food_kitchen, 'https://images.unsplash.com/photo-1591189863430-ab87e120f312?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80')

womens = Event.create(capacity: rand(1..20),
                      description: Faker::Movies::PrincessBride.quote,
                      category: ["women", "shelter"],
                      recurrence_times: 1,
                      address: Faker::Address.full_address,
                      latitude: Faker::Address.latitude,
                      longitude: Faker::Address.longitude,
                      start_time: DateTime.now + (1.0 / 24.0),
                      end_time: DateTime.now + (2.0 / 24.0),
                      name: "Women's Shelter",
                      user: oxfam)
attach_photo(womens, 'https://images.unsplash.com/photo-1504194921103-f8b80cadd5e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80')

bible = Event.create(capacity: rand(1..20),
                     description: Faker::Movies::PrincessBride.quote,
                     category: ["faith", "education"],
                     recurrence_times: rand(1..4),
                     recurrence_frequency: ['days', 'weeks', 'months'].sample,
                     address: Faker::Address.full_address,
                     latitude: Faker::Address.latitude,
                     longitude: Faker::Address.longitude,
                     start_time: DateTime.now + (1.0 / 24.0),
                     end_time: DateTime.now + (2.0 / 24.0),
                     name: "Bible with Us",
                     user: oxfam)
attach_photo(bible, 'https://images.unsplash.com/photo-1504052434569-70ad5836ab65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

puts "🎉 Success, events created!"
puts "---------------------------------------------"
