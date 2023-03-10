class SessionsController < ApplicationController
  def new
  end

  def create
    # user = User.find_by_email(params[:email])
    # # If the user exists and password is correct
    # if user && user.authenticate(params[:password])
    #   # Save user login in browser cookie
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    #   redirect_to '/login'
    # end

    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
