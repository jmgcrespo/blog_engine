class Post < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
  after_create :tweet_author

  def tweeted_author?
    @tweeted_author.present?
  end

  def tweet_author
    return unless author.send_tweet
    Tweeter.new(author)
    @tweeted_author = true
  end
end
