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
    end

    private
    def user_params
      params.require(:user).permit(:name, :username, :password)
    end



end
