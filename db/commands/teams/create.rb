module Commands
  module Team
    class Create < ROM::Commands::Create[:rethinkdb]
      relation :teams
      register_as :create
      result :one
    end
  end
end
