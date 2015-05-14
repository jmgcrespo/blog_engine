require_relative '../models/blog'
require_relative '../models/author'
require_relative '../models/category'

blog = Blog.find_or_create_by!(name: 'Ben Lovell Blog')

blog.authors.find_or_create_by!(name: 'Ben Lovell', twitter_handle: '@benlovell')

blog.categories.find_or_create_by!(name: 'Motorsports')
blog.categories.find_or_create_by!(name: 'Computers')
