class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :followed_user_id, :null => false
      t.integer :follower_id, :null => false
      
      t.timestamps
    end
  end
end
