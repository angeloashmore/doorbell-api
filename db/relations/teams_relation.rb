module Relations
  class Teams < ROM::Relation[:rethinkdb]
    register_as :teams
    dataset :teams

    def by_id(id)
      filter(id: id)
    end

    def for_user(user)
      eq_join(:team_id, r.table(:team_members).filter(user_id: user[:id]))
        .without(right: :id)
    end
  end
end
