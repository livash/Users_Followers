class Following < ActiveRecord::Base
  attr_accessible :followed_user_id, :follower_id
  
  validates :followed_user_id, :follower_id, :numericality => true
  
  belongs_to :follower,
  :class_name => "User",
  :foreign_key => :followed_user_id
  
  belongs_to :followed_user,
  :class_name => "User",
  :foreign_key => :follower_id
end
