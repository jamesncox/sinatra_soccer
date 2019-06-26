class ManagersController < ApplicationController

    get '/signup' do
        if !logged_in?
          erb :"managers/signup"
        else 
          redirect to '/#PLACEHOLDER' 
        end 
      end 
    
      post '/signup' do
       if params[:username] == "" || params[:email] == "" || params[:password] == ""
          redirect to '/signup'
        else
          @manager = Manager.new(:username => params[:username], :email => params[:email], :password => params[:password])
          @manger.save
          session[:manager_id] = @manager.id
          redirect to '/#PLACEHOLDER'
        end 
      end
      
      get '/login' do
        if !logged_in?
          erb :'managers/login'
        else
          redirect to '/tweets'
        end
      end 
      
      post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id 
          redirect to '/tweets'
        else 
          redirect to '/login'
        end 
      end
      
      get '/users/:slug' do 
        @user = User.find_by_slug(params[:slug])
        erb :"users/show"
      end 
    
      get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login' 
        else 
          redirect to '/login'
        end 
      end 
    

end 