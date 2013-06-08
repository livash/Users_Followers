# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.new(:name => "olena", :username => "olena")
user1.scrambled_password = "123"
user1.save!
user2 = User.new(:name => "jon", :username => "jon")
user2.scrambled_password = "123"
user2.save!
user3 = User.new(:name => "sarah", :username => "sarah")
user3.scrambled_password = "123"
user3.save!
user4 = User.new(:name => "jake", :username => "jake")
user4.scrambled_password = "123"
user4.save!

follow1 = Following.create!(:follower_id => 2, :followed_user_id => 1)
follow2 = Following.create!(:follower_id => 3, :followed_user_id => 1)
follow3 = Following.create!(:follower_id => 4, :followed_user_id => 1)

follow4 = Following.create!(:follower_id => 1, :followed_user_id => 2)
follow5 = Following.create!(:follower_id => 3, :followed_user_id => 2)
follow6 = Following.create!(:follower_id => 4, :followed_user_id => 2)
