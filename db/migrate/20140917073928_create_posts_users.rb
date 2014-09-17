class CreatePostsUsers < ActiveRecord::Migration
  def change
    create_table :posts_users do |t|
    	t.column :post_id, :int
    	t.column :user_id, :int
    end
  end
end
