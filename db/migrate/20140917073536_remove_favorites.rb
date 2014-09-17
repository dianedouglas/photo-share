class RemoveFavorites < ActiveRecord::Migration
  def change
  	remove_column :posts, :favorite, :int
  end
end
