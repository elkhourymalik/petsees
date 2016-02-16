class UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy]
  # def index
  #   @users = User.all
  # end

 def show
    @annonces = @user.offers
  end

  # def new
  #   @user = User.new
  # end

  # def edit
  # end

  # def create
  #   @user = user.new(user_params)
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @user.update(user_params)
  #   redirect_to user_path(@offer)
  # end

  # def destroy
  #   @user.delete
  #   redirect_to users_path
  # end

  private
  def user_params
    params.require(:user).permit(:email,:password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
