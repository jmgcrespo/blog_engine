require_relative 'helper'

describe Author do
  it 'has a twitter handle' do
    author = Author.create(name: 'Ben', twitter_handle: '@benlovell')
    author.twitter_handle.must_equal('@benlovell')
  end

  it 'has a github profile' do
  end

  it 'is valid with attributes' do
    blog = Blog.create!(name: 'A Blog')

    author = blog.authors.create!(
      name: 'Ben',
      twitter_handle: '@benlovell'
    )

    author.valid?.must_equal(true)
  end

  it 'requires a blog' do
    author = Author.new(
      name: 'Ben',
      twitter_handle: '@benlovell'
    )

    author.valid?.must_equal(false)
  end
end
