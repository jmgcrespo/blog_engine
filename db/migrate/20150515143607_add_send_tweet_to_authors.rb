class AddSendTweetToAuthors < ActiveRecord::Migration
  def change
  	add_column :authors, :send_tweet, :boolean, default: false
  end
end