class TeamStatsController < ApplicationController
    get '/team_stats' do 
        if logged_in?
         @team_stats = TeamStat.all
         erb :'team_stats/team_stats'
       else
         redirect to '/login'
       end
     end 

     get '/team_stats/new' do 
        if logged_in?
          erb :"team_stats/new"
        else 
          redirect to "/login" 
        end 
      end 
      
      post '/team_stats' do
        if logged_in?
          if params[:team_name] != ""  
            @team_stat = TeamStat.new(team_name: params[:team_name])
            @team_stat.manager = current_manager
            @team_stat.save
            # binding.pry
            redirect to "/team_stats/#{@team_stat.id}"
          else
            redirect to '/team_stats/new'
          end 
        else 
          redirect to '/login' 
        end
      end 

      get '/team_stats/:id' do
        if logged_in?
          @team_stat = TeamStat.find_by_id(params[:id])
          erb :"team_stats/show_team_stats" 
        else 
          redirect to '/login'
        end
      end 

      get '/team_stats/:id/edit' do
        if logged_in?
          @teamstat = TeamStat.find_by_id(params[:id])
          if @teamstat && @teamstat.manager == current_manager 
            erb :"/team_stats/edit_team_stats"
          else 
            redirect to "/team_stats"
          end
        else 
          redirect to "/login" 
        end 
      end 
      

end 