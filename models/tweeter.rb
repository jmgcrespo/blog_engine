require 'twitter'

class Tweeter
  def initialize(author)
    @author = author
  end

  def tweet
    client.update("Hey #{@author.twitter_handle}! Thanks for the ricey post, dude.")
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ""
      config.consumer_secret     = ""
      config.access_token        = ""
      config.access_token_secret = ""
    end
  end
end
