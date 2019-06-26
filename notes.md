Sinata Project: 

Squad Goals 

A manager(user) can update team stats: points and goals scored.

Team belongs to manager.

Manager has many team stats.

Team stats belongs to a manager.

User(manager) can sign up/sign in/sign out.
User can update players on team.
User can update goals scored by player.


Create 
    Create coach(user) who can then:
        Create teams 
        Create players      

Read
    Show teams and its players
    Show players' goals 

Update
    Update players' names and goals

Delete
    Delete player and/or goals 





create_table :manager do |t|
    t.string :name
    t.string :email 
    t.string :password_digest.
end 

create_table :team_stats do |t|
    t.string :name 
    t.integer :points
    t.integer :total_goals
    t.intger :manager_id 
end 