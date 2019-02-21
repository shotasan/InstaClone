class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "登録に成功しました"
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end
end
