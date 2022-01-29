require 'rest_client'

puts "Cleaning DB..."
Booking.destroy_all
Lesson.destroy_all
User.destroy_all

puts "Creating lessons..."
 User.create!(
    email: "daveflanik@gmail.com",
    password: "123456",
    name: Faker::Movies::StarWars.character,
    side: ["Light", "Dark"].sample,
    status: "Jedi",
    description: Faker::Movies::StarWars.wookiee_sentence
  )
5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "1234567890",
    name: Faker::Movies::StarWars.character,
    side: ["Light", "Dark"].sample,
    status: "Jedi",
    description: Faker::Movies::StarWars.wookiee_sentence
  )
  puts "Jedi #{user.id} is created"
end
puts "Finished!"

puts "Creating lessons..."

5.times do
  skill_name = Faker::Superhero.power
  r = RestClient::Request.execute(method: :post, url: 'https://api.deepai.org/api/text-generator', timeout: 600,
    headers: {'api-key' => '627f84fd-c139-46b4-88f9-7d07de412bad'},
    payload: {
        'text' => "#{skill_name} lesson is",
    }
  )
  start_at = Date.current + rand(10).days
  lesson = Lesson.create!(
    user: User.all.sample,
    skill_name: skill_name,
    description: r["output"],
    start_at: start_at,
    end_at: start_at + rand(1..3).days,
    price: rand(20_000..40_000)
  )
  puts "Lesson #{lesson.id} is created"
end
puts "Finished!"
