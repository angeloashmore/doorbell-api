module Relations
  class Users < ROM::Relation[:rethinkdb]
    include RethinkDB::Shortcuts

    register_as :users
    dataset :users

    def by_id(id)
      filter(id: id)
    end

    def by_email(email)
      filter(email: email)
    end
  end
end
