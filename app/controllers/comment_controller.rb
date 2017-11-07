class CommentController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @post.comments << @comment
    @post.save
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    return 
  end

end
