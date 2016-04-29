class SessionsController < ApplicationController
  def new
    @current_user = User.new
  end

  def create
    @current_user = User.find_by(name: user_params[:name])
    if !@current_user.nil? && @current_user.password == user_params[:password]
      session[:user_id] = @current_user.id
      redirect_to @current_user, notice: 'Logged In Successfully'
    else 
      redirect_to :root, notice: 'Invalid Username or Password!'
    end
  end

  def destroy
    reset_session
    redirect_to :root, notice: 'Logged Out Successfully'
  end

  protected

  def session_params
    params.require(:session).permit(:name, :password, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :password, :user_id)
  end
end
