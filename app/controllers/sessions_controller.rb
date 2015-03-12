class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])#User.authenticate(params[:username], params[:password])
    if @user.password == BCrypt::Engine.hash_secret(params[:password], @user.password_salt)
      session[:user_id] = @user.id
      session[:emp_id] = @user.employeeId
      redirect_to root_url, :notice => 'Logged in!'
    else
      render 'new', :notice=> 'Invalid username or password'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:emp_id] = nil
    redirect_to customers_path, notice: "Logged out!"
  end
end