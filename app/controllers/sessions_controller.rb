class SessionsController < ApplicationController
  
  def new 
  end
  
  def create
    log_in(params[:email], params[:password])
  end 
  
  def destroy 
    log_out if logged_in?
    redirect_to root_url 
  end
  
  
  private 
 
  
end
