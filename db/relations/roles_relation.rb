module Relations
  class Roles < ROM::Relation[:sql]
    register_as :roles
    dataset :roles

    def by_id(id)
      where(id: id)
    end

    def for_users(users)
      where(user_id: users.map { |u| u.id })
    end

    def for_teams(teams)
      where(resource_type: "team", team_id: teams.map { |t| t.id })
    end
  end
end
