class SessionsController < ApplicationController
  def login
  end

  def create
    @user = User.find_by(email: session_params[:email])
    binding.pry

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to houses_path
    else
      # redirect_to login_path
      render :login
    end
  end

  def logout
    session.clear
    redirect_to login_path
  end





def session_params
    params.require('session').permit(:email, :password)
  end


end
