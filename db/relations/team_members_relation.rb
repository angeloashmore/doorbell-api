module Relations
  class TeamMembers < ROM::Relation[:rethinkdb]
    register_as :team_members
    dataset :team_members

    def by_id(id)
      where(id: id)
    end

    def for_users(users)
      where(user_id: Array.wrap(users).map { |u| u[:id] })
    end
    alias_method :for_user, :for_users

    def for_teams(teams)
      where(team_id: Array.wrap(teams).map { |t| t[:id] })
    end
    alias_method :for_team, :for_teams
  end
end
