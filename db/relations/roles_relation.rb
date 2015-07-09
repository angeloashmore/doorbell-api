module Relations
  class Roles < ROM::Relation[:sql]
    register_as :roles
    dataset :roles

    def by_id(id)
      where(id: id)
    end

    def for_users(user_ids)
      where(user_id: user_ids)
    end
    alias_method :for_user, :for_users

    def for_teams(team_ids)
      where(team_id: team_ids)
    end
    alias_method :for_team, :for_teams
  end
end
