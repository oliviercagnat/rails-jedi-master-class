puts "Cleaning DB..."
Lesson.destroy_all
User.destroy_all

puts "Creating lessons..."

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "1234567890",
    name: Faker::Movies::StarWars.character,
    side: ["Light", "Obscure"].sample,
    status: "Jedi",
    description: Faker::Movies::StarWars.wookiee_sentence
  )
  puts "Jedi #{user.id} is created"
end
puts "Finished!"

puts "Creating lessons..."

10.times do
  start_at = Date.current + rand(10).days
  lesson = Lesson.create!(
    user: User.all.sample,
    skill_name: Faker::Superhero.power,
    description: Faker::Lorem.paragraph,
    start_at: start_at,
    end_at: start_at + rand(1..3).days,
    price: rand(20_000..40_000)
  )
  puts "Lesson #{lesson.id} is created"
end
puts "Finished!"
