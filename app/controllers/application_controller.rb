class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # in this file(Application controller) all method we create
  # is available to all Controller 
  # But Not available to "Views" 
  # we have to make available in View we use "Helper Method"
  
  
  helper_method :current_user, :logged_in?
  def current_user
    @current_use ||= Chef.find(session[:chef_id]) if session[:chef_id]
    #memomization ||=
    
  end
  
  def logged_in?
    !!current_user
  end
  def require_user
    if !logged_in?
      flash[:danger]="You Must Be Login To Perform Action"
      redirect_to root_path
    end
  end
end
