class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save && params[:password] == params[:password_confirmation]
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.name}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Please check your email and password information"
      redirect_to register_path
    end
  end

  def show
    @facade = UserDashboardFacade.new(current_user, params[:advice_topic])
  end

private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
