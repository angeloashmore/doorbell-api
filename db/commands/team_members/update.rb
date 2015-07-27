module Commands
  module TeamMember
    class Update < ROM::Commands::Update[:sql]
      relation :team_members
      register_as :update
      result :one
    end
  end
end
