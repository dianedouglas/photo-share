class AddFavoritesColumn < ActiveRecord::Migration
  def change
  	add_column :posts, :favorite, :int
  end
end
