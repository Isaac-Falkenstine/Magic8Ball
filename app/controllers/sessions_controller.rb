class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.name}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Looks like your email or password is invalid"
      redirect_to login_path
    end
  end
end
