require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "squadgoals"
  end

  get "/" do
    erb :index
  end

  helpers do 
    
    def logged_in?
      !!current_manager
    end
    
    def current_manager 
      @current_manager ||= Manager.find_by_id(session[:manager_id]) if session[:manager_id]
    end 
    
  end 

end
