module Commands
  module TeamMember
    class Delete < ROM::Commands::Delete[:sql]
      relation :team_members
      register_as :delete
      result :one
    end
  end
end
