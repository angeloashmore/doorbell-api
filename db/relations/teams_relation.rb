module Relations
  class Teams < ROM::Relation[:sql]
    register_as :teams
    dataset :teams

    def by_id(id)
      where(id: id)
    end

    def for_user(user_id)
      qualified.inner_join(:roles, team_id: :id).where(roles__user_id: user_id)
    end
  end
end
