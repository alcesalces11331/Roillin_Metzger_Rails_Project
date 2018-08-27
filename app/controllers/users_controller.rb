class UsersController < ApplicationController
  #before_action :login_checkpoint, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
