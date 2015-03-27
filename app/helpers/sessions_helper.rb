module SessionsHelper
  # Logs in the given user. 
  
  #Logs out the user. 
  def log_out
    session.delete(:id)
    session.delete(:token)
    session.delete(:type)
    @current_user = nil 
  end 
  
  def logged_in?
    !current_user.nil?
  end
  
   
  
  private
  
  def log_in(email, password)
    user = Login.new(email: email, password: password)
    if user.valid? && user.save && user.response[:success] == 1
      session[:id] = user.response[:userCredentials][:id]
      session[:token] = user.response[:userCredentials][:token]
      session[:type] = user.response[:userCredentials][:indicator]
      session[:email] = user.email
      redirect_to root_url
    else
      flash.now[:alert] = "Invalid email or password"
      render "sessions/new"
    end    
  end 
  
  def current_user 
    @current_user ||= {:id => session[:id], :token => session[:token], :type => session[:type], :email => session[:email]} if session[:id]
  end
  
end
