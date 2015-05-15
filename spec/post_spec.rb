require_relative 'helper'

describe Post do
  describe 'on creation of a post' do
    it 'sends a tweet to the author' do
      blog = Blog.create!(name: 'BenBlog')
      author = blog.authors.create!(name: 'Ben', twitter_handle: '@benlovell')
      category = blog.categories.create!(name: 'Introductions')

      post = category.posts.create!(
        title: 'Hello, world',
        content: 'Hi!',
        author: author
      )

      post.tweeted_author?.must_equal(true)
    end
  end

  it 'defaults `tweeted_author?` to false' do
    Post.new.tweeted_author?.must_equal(false)
  end
end
