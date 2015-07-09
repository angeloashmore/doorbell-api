module Relations
  class Profiles < ROM::Relation[:sql]
    register_as :profiles
    dataset :profiles

    def by_id(id)
      where(id: id)
    end

    def for_users(users)
      where(user_id: Array.wrap(users).map { |u| u[:id] })
    end
    alias_method :for_user, :for_users
  end
end
