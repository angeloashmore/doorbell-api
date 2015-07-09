module Relations
  class Teams < ROM::Relation[:sql]
    register_as :teams
    dataset :teams

    def by_id(id)
      where(id: id)
    end

    def for_user(user)
      qualified.left_join(:roles, team_id: :id).where(roles__user_id: user.id).group(:teams__id)
    end
  end
end
