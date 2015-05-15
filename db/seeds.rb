require_relative '../models/author' 
require_relative '../models/blog'
require_relative '../models/category'
require_relative '../models/post'
require 'faker'

blog = Blog.find_or_create_by!(name: 'Ben Lovell Blog')
( categories = [] ) << blog.categories.find_or_create_by!(name: 'Motorsport')
categories << blog.categories.find_or_create_by!(name: 'Computers')

10.times do 
	author = blog.authors.find_or_create_by!(name: "#{Faker::Name.name}", 
			twitter_handle: "@#{Faker::Name.first_name}")
	categories.sample.posts.create!(title: "#{Faker::Hacker.ingverb} in #{Faker::App.name}",
						content: "#{Faker::Hacker.say_something_smart}",
						author: author)
end

