class PostController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @newpost = Post.new(post_params)
    @newpost.save
    redirect_to action: 'index'
  end
end
