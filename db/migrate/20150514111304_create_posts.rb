class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
