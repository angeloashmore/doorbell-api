module Commands
  module Team
    class Delete < ROM::Commands::Delete[:rethinkdb]
      relation :teams
      register_as :delete
      result :one
    end
  end
end
