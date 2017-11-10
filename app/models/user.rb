class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :received_follows, class_name: 'Relationship', foreign_key: :followed_id #followed_requests => new followers
  has_many :sent_follows, class_name: 'Relationship', foreign_key: :follower_id #which is an instance of the Relationship model

  has_many :followers, through: :received_follows, source: :follower
  has_many :following, through: :sent_follows, source: :followed
end
