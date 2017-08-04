class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:products], notice: 'Successfully Registered!'
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end