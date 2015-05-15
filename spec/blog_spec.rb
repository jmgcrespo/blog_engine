require_relative 'helper'

describe Blog do
  it 'is valid with valid attributes' do
    blog = Blog.new(name: 'BenBlog')

    blog.valid?.must_equal(true)
  end

  it 'requires a name' do
    blog = Blog.new

    blog.valid?.must_equal(false)
  end

  it 'requires a unique name' do
    Blog.create!(name: 'My Blog')

    blog = Blog.new(name: 'My Blog')

    blog.valid?.must_equal(false)
  end

  it 'has many posts through categories' do
    blog = Blog.create!(name: 'BenBlog')
    author = blog.authors.create!(name: 'Ben Lovell')
    category = blog.categories.create!(name: 'Motorsports')

    Post.create!(
      title: 'Formula 1',
      content: 'My first post',
      author: author,
      category: category
    )

    blog.posts.empty?.must_equal(false)
  end

  it 'has many authors'

  it 'has many categories'
end
