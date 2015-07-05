module Commands
  module Team
    class Create < ROM::Commands::Create[:sql]
      relation :teams
      register_as :create
      result :one
    end
  end
end
