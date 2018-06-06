require 'faker'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'mongoid'
Dir['lib/*.rb'].each { |file| require_relative file }

configure do
  Mongoid.load!('./mongoid.yml')
end

Author.delete_all
Book.delete_all
Follow.delete_all
Upvote.delete_all
User.delete_all

# create test user
user = User.new(name: Faker::Name.name)
user.save!

# create authors
6.times do
  Author.create!(name: Faker::Name.name)
end

# create follow
author = Author.first
user.follows.create!(author: author)

# create books
Author.all.each do |author|
  author.books.create!(
    title: Faker::Book.title,
    published_on: Faker::Date.between('2014-01-01', Date.today)
  )
end

# create upvotes
# Book.last(3).each do |book|
#   user.upvotes.create(book: book)
# end
