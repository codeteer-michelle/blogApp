 class Post < ActiveRecord::Base
  # By putting dependent:destroy, we are making it so the comments get deleted if a post is deleted. Otherwise the comments will keep taking up room in memory
  has_many :comments, dependent :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end