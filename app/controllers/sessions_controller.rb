class SessionsController < ApplicationController
  
  def create
    render 'new'
  end

  def new
    @user = User.new
  end

  def destroy
    # stuff here
  end
end
