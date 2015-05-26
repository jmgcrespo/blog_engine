require 'twitter'

class Tweeter
  def initialize(author)
    @author = author
  end

  def tweet
    client.update(
      "Hey #{@author.twitter_handle}! Thanks for your post and your fooding"
    )
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = UserAuth::YOUR_CONSUMER_KEY
      config.consumer_secret     = UserAuth::YOUR_CONSUMER_SECRET
      config.access_token        = UserAuth::YOUR_ACCESS_TOKEN
      config.access_token_secret = UserAuth::YOUR_ACCESS_SECRET
    end
  end
end
