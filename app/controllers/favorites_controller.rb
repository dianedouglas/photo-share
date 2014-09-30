class FavoritesController <  ApplicationController

  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    if @favorite.save
      flash[:notice] = "Favorited!"
    end
    if params[:from] == "user_posts"
      redirect_to user_posts_path(current_user.id)
    elsif params[:from] == "index_posts"
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

  def destroy
    Favorite.destroy(params[:id])
    if params[:from] == "user_posts"
      redirect_to user_posts_path(current_user.id)
    elsif params[:from] == "index_posts"
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

end
