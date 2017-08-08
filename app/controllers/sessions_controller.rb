class SessionsController < ApplicationController
  
  def create
    if user = User.authenticate_with_credentials(session_params[:email], session_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login', flash: { error: 'Invalid user email or password.' }
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
