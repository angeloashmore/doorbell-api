module Commands
  module Event
    class Delete < ROM::Commands::Delete[:sql]
      relation :events
      register_as :delete
      result :one
    end
  end
end
