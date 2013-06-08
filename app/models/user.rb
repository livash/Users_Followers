class User < ActiveRecord::Base
  attr_accessible :name, :username, :password
  
  validates :username, :uniqueness => true
  
  has_many :followers,
  :class_name => "Following",
  :foreign_key => :followed_user_id
  
  has_many :followed_users,
  :class_name => "Following",
  :foreign_key => :follower_id
end
