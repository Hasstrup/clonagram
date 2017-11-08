class CommentController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @user =  User.find(params[:user_id])
    @user.comments << @comment
    @user.save
    return
  end

  def destroy
    @comment = Post.find(params[:post_id]).comments.find(params[:id])
    @comment.destroy
    return
  end

  private
    def comment_params
      params.require(:comment).permit(:body)

end
