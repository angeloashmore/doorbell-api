module Commands
  module TeamMember
    class Create < ROM::Commands::Create[:sql]
      relation :team_members
      register_as :create
      result :one
    end
  end
end
