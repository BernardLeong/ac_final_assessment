class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id]
  end


  def update
    @user = User.find(params[:id]
    if @user.update(user_params)
      flash[:notice] = "User successfully created"
      redirect_to 
    else
      flash.now[:alert] ="Profile failed to create"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end


end
