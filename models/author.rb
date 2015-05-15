class Author < ActiveRecord::Base
  belongs_to :blog
  has_many :posts

  validates :blog, presence: true
end
