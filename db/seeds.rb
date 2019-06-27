


  3.times do |team|

    TeamStat.create!(
        team_name: "#{team}",
        points: 100,
        goals_scored: 50,
        manager_id: 1
    )

  end 