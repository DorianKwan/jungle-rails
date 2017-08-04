class SessionsController < ApplicationController
  
  def create
    
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice] = 'Invalid user email or password.'
      redirect_to '/login'
    end

  end

  def new
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private
  
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
