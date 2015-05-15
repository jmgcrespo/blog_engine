require_relative 'helper'

describe Author do
  before do
    blog = Blog.create!(name: 'Meh')
    @author = blog.authors.create!(
      name: 'Ben',
      twitter_handle: '@benlovell'
    )
  end

  it 'has a twitter handle' do
    @author.twitter_handle.must_equal('@benlovell')
  end

  it 'is valid with valid attributes' do
    @author.valid?.must_equal(true)
  end

  it 'requires a blog' do
    author = Author.new(
      name: 'Ben',
      twitter_handle: '@benlovell'
    )

    author.valid?.must_equal(false)
  end
end
