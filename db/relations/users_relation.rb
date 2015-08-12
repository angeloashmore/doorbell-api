module Relations
  class Users < ROM::Relation[:rethinkdb]
    include RethinkDB::Shortcuts

    register_as :users
    dataset :users

    def by_id(id)
      filter(id: id)
    end

    def by_ids(ids)
      filter { |doc| r.expr(ids).contains(doc[:id])}
    end

    def by_email(email)
      filter(email: email)
    end

    def for_team(team)
      eq_join(:user_id, r.table(:team_members).filter(id: team[:id]))
        .without(right: :id)
    end
  end
end
