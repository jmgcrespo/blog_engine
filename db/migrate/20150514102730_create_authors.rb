class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name, unique: true
      t.references :blog
    end
  end
end
