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

    def for_teams(teams)
      where(resource_type: "team", team_id: teams.map { |t| t.id })
    end
  end
end
