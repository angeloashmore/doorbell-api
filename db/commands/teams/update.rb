module Commands
  module Team
    class Update < ROM::Commands::Update[:sql]
      relation :teams
      register_as :update
      result :one
    end
  end
end
