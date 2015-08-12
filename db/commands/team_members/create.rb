module Commands
  module TeamMember
    class Create < ROM::Commands::Create[:rethinkdb]
      relation :team_members
      register_as :create
      result :one
    end
  end
end
