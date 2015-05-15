class Post < ActiveRecord::Base
  belongs_to :author
  belongs_to :category

  after_create :tweet_author

  def tweeted_author?
    @tweeted_author.present?
  end

  def tweet_author
    Tweeter.new(author).tweet

    @tweeted_author = true
  end
end
