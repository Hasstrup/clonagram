class UsersController < ApplicationController

    def index
      @users = User.all
      render json: @users
    end

    def new
    end

    def create
      @user = User.new(user_params)
      @user.save
      redirect_to action: 'index' #remember this method and it's type of params
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def edit
      @user = User.find(params[:id])
      format.json {render json: @user}
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      return
    end

    def add_follower
      @relationship = Relationship.create(follower_id: params[:id], followed_id: params[:user_id])
      @relationship.save
      return
    end

    private
    def user_params
      params.require(:user).permit(:name, :username, :password)
    end
end
