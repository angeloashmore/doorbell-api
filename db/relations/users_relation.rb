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

    def by_email(email)
      where(email: email)
    end

    def for_teams(teams)
      qualified
        .inner_join(:roles, user_id: :id)
        .where(roles__team_id: Array.wrap(teams).map { |t| t[:id] })
    end
    alias_method :for_team, :for_teams
  end
end
