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
          redirect to '/#PLACEHOLDER'
        end
      end 
      
      post '/login' do 
        @manager = Manager.find_by(username: params[:username])
        if @manager && @manager.authenticate(params[:password])
          session[:manager_id] = @manager.id 
          redirect to '/#PLACEHOLDER'
        else 
          redirect to '/login'
        end 
      end
      
      get '/managers/:slug' do 
        @manager = Manager.find_by_slug(params[:slug])
        erb :"managers/show"
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