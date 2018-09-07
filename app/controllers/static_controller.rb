class StaticController < ApplicationController
  def welcome
    if params[:user].blank?
      redirect_to signin_path
    else
      @user = User.find_by(id: current_user.id)
    end
  end
end
