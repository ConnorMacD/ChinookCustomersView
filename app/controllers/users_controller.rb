class UsersController < ApplicationController
	def new 
		@user = User.new
		@employees = Employee.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to customers_path, notice: 'Account created!'
    else
      render :new
    end
  end



  #Private Defs for create/edit/new
  private
  def user_params
    params.require(:user).permit(:username, :password, :employeeId)
  end

end