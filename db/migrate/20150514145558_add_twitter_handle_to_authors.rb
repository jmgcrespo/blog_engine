class AddTwitterHandleToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :twitter_handle, :string
  end
end
