class PostController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @newpost = Post.new(post_params)
    @user = User.find(params[:user_id])
    @user.posts << @newpost
    @newpost.save
    @user.save
    redirect_to action: 'index'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    return
  end

  private
  def post_params
    params.require(:post).permit(:image_url, :caption)
  end

end
