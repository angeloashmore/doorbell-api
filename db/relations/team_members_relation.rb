module Relations
  class TeamMembers < ROM::Relation[:rethinkdb]
    register_as :team_members
    dataset :team_members

    def by_id(id)
      filter(id: id)
    end

    def for_user(user)
      filter(user_id: user[:id])
    end

    def for_team(team)
      filter(team_id: team[:id])
    end
  end
end
