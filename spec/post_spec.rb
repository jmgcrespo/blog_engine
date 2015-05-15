require_relative 'helper'
require "byebug"

describe Post do

		before do
    @blog = Blog.create!(name: 'BenBlog')
    @author = @blog.authors.create!(name: 'Ben Lovell', twitter_handle: 'benlovell')
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

	describe 'on creation of a post' do
		it 'doesn´t send a tweet befor create' do

			post = @category.posts.new(title: 'Boats are great',
							content: 'low comsumption',
							author: @author)

			post.tweeted_author?.must_equal(false)

		end

		it 'sends a tweet to the author if send_tweet true' do
			@author.send_tweet = true

			post = @author.posts.create!(
				title: "Migrations as command pattern",
				content: "There is litle else to say..",
				category: @category)

			post.tweeted_author?.must_equal(true)
		end

		it 'doesn´t sends a tweet to the author by default' do
			
			post = @author.posts.create!(
				title: "Migrations as command pattern",
				content: "There is litle else to say..",
				category: @category)

			post.tweeted_author?.must_equal(false)
		end

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
