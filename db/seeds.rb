puts "Cleaning DB..."
Lesson.destroy_all
User.destroy_all

puts "Creating lessons..."

unsplash_url = "http://source.unsplash.com/1600x900/?"

5.times do
  # Separate the name in order to do the interpollation
  name = Faker::Movies::StarWars.character
  user = User.create!(
    email: Faker::Internet.email,
    password: "1234567890",
    name: name,
    side: ["Light", "Dark"].sample,
    status: "Jedi",
    description: Faker::Movies::StarWars.wookiee_sentence

    # Still in progress, need to fix it
    # Raise Invalid Signature Error
    # avatar: "#{unsplash_url}#{name}"
  )
  puts "Jedi #{user.id} is created"
end
puts "Finished!"

puts "Creating lessons..."

10.times do
  start_at = Date.current + rand(10).days
  # Separate the skill name in order to do interpollation below
  skill_name = Faker::Superhero.power
  lesson = Lesson.create!(
    user: User.all.sample,
    skill_name: skill_name,
    description: Faker::Lorem.paragraph,
    start_at: start_at,
    end_at: start_at + rand(1..3).days,
    price: rand(20_000..40_000),
    skill_picture: "#{unsplash_url}#{skill_name}"
  )
  puts "Lesson #{lesson.id} is created"
end
puts "Finished!"
