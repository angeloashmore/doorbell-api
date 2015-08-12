module Commands
  module TeamMember
    class Update < ROM::Commands::Update[:rethinkdb]
      relation :team_members
      register_as :update
      result :one
    end
  end
end
