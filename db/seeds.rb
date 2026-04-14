# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.find_or_create_by!(email: 'student@link.cuhk.edu.hk') do |u|
  u.password = '123456'
  u.password_confirmation = '123456'
end

books = [
  { title: 'Ruby on Rails Tutorial', author: 'Michael Hartl', price: 120, condition: 'Like New', location: 'Shaw College' },
  { title: 'Clean Code', author: 'Robert Martin', price: 90, condition: 'Very Good', location: 'United College' },
  { title: 'Design Patterns', author: 'Erich Gamma', price: 60, condition: 'Good', location: 'Wu Yee Sun College' },
  { title: 'Introduction to Algorithms', author: 'Cormen', price: 150, condition: 'Like New', location: 'Morningside College' },
  { title: 'Python Crash Course', author: 'Eric Matthes', price: 100, condition: 'Very Good', location: 'CW Chu College' }
]

books.each do |book|
  Book.create!(
    user: user,
    title: book[:title],
    author: book[:author],
    price: book[:price],
    condition: book[:condition],
    location: book[:location],
    status: :available
  )
end

puts "Created #{Book.count} books"
puts "User email: student@link.cuhk.edu.hk, password: 123456"