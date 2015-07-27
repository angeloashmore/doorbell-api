module Relations
  class Teams < ROM::Relation[:sql]
    register_as :teams
    dataset :teams

    def by_id(id)
      where(id: id)
    end

    def for_users(users)
      qualified
        .left_join(:team_members, team_id: :id)
        .where(team_members__user_id: Array.wrap(users).map { |u| u[:id] })
        .group(:teams__id)
    end
    alias_method :for_user, :for_users
  end
end
