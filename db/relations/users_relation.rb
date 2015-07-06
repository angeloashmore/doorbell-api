module Relations
  class Users < ROM::Relation[:sql]
    register_as :users
    dataset :users

    def by_id(id)
      where(id: id)
    end
  end
end
