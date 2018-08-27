class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # conditional for OAuth or else
    if auth
      @user = User.find_or_create_by_omniauth(auth)

      session[:user_id] = @user.id

      render 'static/welcome'
    else
      session_create_helper
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def session_create_helper
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render 'static/welcome'
    else
      render 'static/welcome'
    end
  end

end
