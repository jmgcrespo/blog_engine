require_relative 'helper'
require "byebug"

describe Post do

		before do
    @blog = Blog.create!(name: 'BenBlog')
    @author = @blog.authors.create!(name: 'Ben Lovell')
    @category = @blog.categories.create!(name: 'Motorsports')

    @post=Post.create!(
      title: 'Formula 1',
      content: 'My first post',
      author: @author,
      category: @category
    )
    @comment1= @post.comments.create!(name: "Manu", content: "Congratulations!")
    @comment2= @post.comments.create!(name: "Anonymous", content: "I couldn´t agree more")
    @tag1 = @post.tags.create!(name: "speed")
    @tag2 = @post.tags.create!(name: "noise")
	end
  it 'belongs to an author' do
  	@author.posts.include?(@post)
  end

  it 'has many comments' do
  	@post.comments.length.must_equal(2)
  end

  it 'belongs to a category' do
  	@category.posts.include?(@post)
  end

  it 'belongs to a blog through a category' do
  	@blog.posts.include?(@post)	
  end

  it 'has many tags through posttags' do
  	@post.tags.length.must_equal(2)
  end
end
