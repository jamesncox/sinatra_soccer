class UpdateTeamStatsTeamName < ActiveRecord::Migration
  def change
    rename_column :team_stats, :name, :team_name
  end
end
