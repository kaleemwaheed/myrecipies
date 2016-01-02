 class LoginsController < ApplicationController
   before_action :require_user ,only:[:destroy]
   def new
     
   end
   def create
     chef = Chef.find_by(email: params[:email])
     if chef && chef.authenticate(params[:password])
       session[:chef_id] = chef.id
       flash[:success] = "You are Login Now"
       redirect_to recipes_path
       
     else
       flash.now[:danger]="your email or password does not Match"
       render "new"
     end
   end
   def destroy
     session[:chef_id] = nil
     flash[:success]="You successfully Logout"
     redirect_to root_path
   end
 end