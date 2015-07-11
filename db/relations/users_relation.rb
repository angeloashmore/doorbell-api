module Relations
  class Users < ROM::Relation[:sql]
    register_as :users
    dataset :users

    def by_id(id)
      where(id: id)
    end

    def by_remote_id(id)
      where(remote_id: id)
    end
  end
end
