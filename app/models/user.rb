class User < ApplicationRecord

  has_many :favorites
  has_many :articles, through: :favorites
  has_many :searchs
  has_many :search_terms, through: :searches

  # They're following many people:
  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followee_follows, source: :followee

  # They're followed by many people:
  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower

  has_secure_password
  validates :password, presence: true
  validates :username, uniqueness: true
  acts_as_google_authenticated :column_name => :username
end
