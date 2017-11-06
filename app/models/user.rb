class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :received_follows, class_name: 'Relationship', foreign_key: :followed_id #followed_requests => new followers
  has_many :sent_follows, class_name: 'Relationship', foreign_key: :follower_id

  has_many :followers, through: :received_follows, source: :follower
  has_many :following, through: :sent_follows, source: :followed
end
