class Movie < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  def self.search(search)
  where("title ILIKE ?" , "%#{search}%")
  end
  # Impressive implementation of class methods for search functionality
end
