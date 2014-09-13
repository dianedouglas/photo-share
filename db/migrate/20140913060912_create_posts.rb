class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.column :description, :string
    end
  end
end
