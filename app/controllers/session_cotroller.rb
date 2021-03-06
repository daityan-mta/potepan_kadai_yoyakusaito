class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(mailaddress: params[:session][:mailaddress])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
