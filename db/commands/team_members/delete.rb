module Commands
  module TeamMember
    class Delete < ROM::Commands::Delete[:rethinkdb]
      relation :team_members
      register_as :delete
      result :one
    end
  end
end
