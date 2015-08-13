module Relations
  class Teams < ROM::Relation[:rethinkdb]
    include RethinkDB::Shortcuts

    register_as :teams
    dataset :teams

    def by_id(id)
      filter(id: id)
    end
  end
end
