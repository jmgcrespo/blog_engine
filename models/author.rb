class Author < ActiveRecord::Base
  belongs_to :blog

  validates :blog, presence: true
end
