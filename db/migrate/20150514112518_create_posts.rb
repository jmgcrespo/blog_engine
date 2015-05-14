class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
    	t.string :content
    	t.reference :author
    end
  end
end
