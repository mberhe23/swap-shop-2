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
default_password = "123456"

user_names = ["Andy", "Brenda", "Francine", "Georgia", "Jessica", "Melissa"]

users = []
user_names.each do |user|
  users << User.create!(
    email: "#{user.downcase}@users.com",
    password: default_password,
    first_name: user
  )
end

# photos will be sent to cloudinary
users.map do |user|
  file = File.open("db/support/#{user.first_name}.jpg")
  user.photo.attach(io: file, filename: "#{user.first_name}.jpg", content_type: 'image/jpg')
  user.save!
end

puts "---done---"

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

puts "---done---"
