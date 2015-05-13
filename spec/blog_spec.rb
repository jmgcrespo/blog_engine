require_relative 'helper'
require "byebug"

describe Blog do

	before do
    @blog = Blog.create!(name: 'BenBlog')
    @author = @blog.authors.create!(name: 'Ben Lovell')
    @category = @blog.categories.create!(name: 'Motorsports')

    Post.create!(
      title: 'Formula 1',
      content: 'My first post',
      author: @author,
      category: @category
    )

	end

  it 'has many posts through categories' do
    @blog.posts.empty?.must_equal(false)
  end

  it 'has many authors' do
    author2 = @blog.authors.create!(name: 'Manu')	
    @blog.authors.length.must_equal(2)
  end
  it 'has many categories' do
  	@blog.categories.create!(name: 'Sailing')
  	@blog.categories.count.must_equal(2)
	end
end
