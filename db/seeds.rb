# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "---cleaning database---"
Listing.destroy_all
User.destroy_all

# Users
puts "---creating fake users---"

10.times do
  puts "Creating user..."
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
# photos will be sent to cloudinary
  image_url = "https://source.unsplash.com/200x200/?profile picture"
  downloaded_image = URI.open(image_url)
  user.photo.attach(io: downloaded_image, filename: "user-#{user.id}")
  # user.photo.attach(io: File.open(Rails.root.join('app/assets/images/default_avatar.jpg')), filename: 'default_avatar.jpg')

  user.save
  puts "User #{user.id} has been created."
end
puts "---users have been created---"

# Listings
puts "---creating fake listings---"

# listings = {
#   tops: "t-shirt",
#   bottoms: "jeans",
#   outerwear: "coat",
#   dresses: "long dress",
#   shoes: "sneakers"
# }

# def listingCatTitle
#   create a method to grab the key as the category and the value as the title?
# end

titles = ["jeans", "blouse", "coat", "long dress", "jean jacket"]
categories = ["tops", "bottoms", "outerwear", "dresses", "shoes"]

titles.map do |title|
  file2 = File.open("db/support/#{title.parameterize}.jpg")
  listing = Listing.new(
    user: users.sample,
    title: title,
    description: "Something about the item.",
    category: categories.sample
  )
  listing.photos.attach(io: file2, filename: "#{title.parameterize}.jpg", content_type: 'image/jpg')
  listing.save!
  # add more photos?
end

puts "---listings have been created---"
