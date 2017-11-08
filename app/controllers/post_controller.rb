class PostController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to action: 'index'
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    return
  end

  private
  def post_params
    params.require(:post).permit(:image_url, :caption)
  end

end
