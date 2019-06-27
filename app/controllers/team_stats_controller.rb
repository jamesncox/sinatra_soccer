class TeamStatsController < ApplicationController
    get '/team_stats' do 
        if logged_in?
         @team_stats = TeamStats.all
         erb :'team_stats/team_stats'
       else
         redirect to '/login'
       end
     end 

end 