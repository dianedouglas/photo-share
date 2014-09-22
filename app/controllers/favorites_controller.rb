class FavoritesController <  ApplicationController

  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    if @favorite.save
      flash[:notice] = "Favorited!"
    end
    redirect_to root_path
  end

  def destroy
    Favorite.destroy(params[:id])
    redirect_to root_path
  end

end
