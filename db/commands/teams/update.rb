module Commands
  module Team
    class Update < ROM::Commands::Update[:rethinkdb]
      relation :teams
      register_as :update
      result :one
    end
  end
end
