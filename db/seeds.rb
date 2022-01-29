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

skill_description = ["It was rarely used on a person, and the effects it had on inanimate objects and people were devastating. Depending on the size, density and vulnerability of the object in question, combustion would become harder or easier to use successfully.

The intensity of the blast could injure an entire room of enemies, particularly if the affected object is made of flammable material.

It is disputed whether combustion could be prevented and stopped if another Force user concentrated on an object to prevent it from exploding. This may have canceled it out, or it may have done nothing. Yarael Poof was known to use this power.

Darth Sidious considered this ability a 'mere child's' in The Jedi Path: A Manual for Students of the Force.

", "By channeling this ability, a Force-user harnessed fury and hatred and then projected them through an intense glare onto the victim - as long as that victim was in the practitioner's range of vision. The Deadly Sight would have then blistered the skin and vaporized extremities.", "An application of the Force used by the Jedi Order, the Council of First Knowledge classified as a technique which fell under the umbrella of skills known as Alter. Alter abilities were those which called upon the Force to manipulate things in the environment separate from the user.

Mastery of this skill came hand-in-hand with mastery over lightsaber combat, as it was used in conjunction with use of the weapon. When used correctly, a practitioner could manipulate the energy of the lightsaber and reduce the damage caused to the target. Used while fighting both living and non-living opponents, this technique could make the difference between killing an opponent or completely disabling a droid or piece of machinery.

", "Electric Judgment, also known as Emerald Lightning, was a Force technique used by the Jedi to spray electric bolts of variable intensity from the hands and fingers. It manifested as yellow-orange or green Force lightning instead of blue or white, but otherwise it was very similar in both appearance and usage to the dark side Force power known as Force lightning.

","Similar to a Force trance, morichro suspended biological functions, including breathing and heart rate. A trained morichro user could turn the technique upon himself, surviving without food, water, or even air for periods of over a year at a time, though it would not protect against vacuum. But unlike a Force trance, it could also be turned on others, making it an effective way of subduing enemies. However, failure to monitor a targeted opponent could render them permanently unconscious or cause them to die of dehydration or starvation."]

5.times do
  #skill_name = Faker::Superhero.power
  # r = RestClient::Request.execute(method: :post, url: 'https://api.deepai.org/api/text-generator', timeout: 600,
  #   headers: {'api-key' => '627f84fd-c139-46b4-88f9-7d07de412bad'},
  #   payload: {
  #       'text' => "#{skill_name} lesson is",
  #   }
  # )
  start_at = Date.current + rand(10).days
  lesson = Lesson.create!(
    user: User.all.sample,
    skill_name: Faker::Superhero.power,
    description: skill_description.sample,
    start_at: start_at,
    end_at: start_at + rand(1..3).days,
    price: rand(20_000..40_000)
  )
  puts "Lesson #{lesson.id} is created"
end
puts "Finished!"
