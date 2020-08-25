class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t "user.new.welcome"
      redirect_to @user
    else
      flash[:danger] = t "user.new.danger"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit User::USERS_PARAMS
  end
end
