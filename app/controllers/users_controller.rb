class UsersController < ApplicationController
  
  def new 
    @user = User.new(email: nil, first: nil, last: nil,
                                location: nil, type: nil, password: nil) 
  end 
  
  def create
    @user = User.new(user_params)
    
    if @user.valid? && @user.save && @user.response[:success] == 1
      log_in(@user.email, @user.password)
      flash[:info] = "Please check your email to activate your account."
    else  
     render 'new'
    end
      
  end 
  
  def show
    
  end
  
  def update
  end 
  
  def destroy 
  end 
  
  private 
  
  def user_params
    params.require(:user).permit(:first, :last, :location, 
                                :type, :email, :password)                             
  end
  
  
end
