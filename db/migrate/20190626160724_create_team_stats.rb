class CreateTeamStats < ActiveRecord::Migration
  def change
    create_table :team_stats do |t|
      t.string :name 
      t.integer :points
      t.integer :goals_scored
      t.integer :manager_id 
    end 
  end
end
