class PostsController <  ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.user_id = current_user.id
    # @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user.id)
      flash[:notice] = "Thanks for posting!"
    else
      render 'new'
    end
  end

  def index
    if params[:user_id]
      @posts = current_user.posts
    else
      @posts = Post.all
    end
  end

  private
  def post_params
    params.require(:post).permit(:image_upload, :description).merge({user_id: current_user.id})
  end

end
