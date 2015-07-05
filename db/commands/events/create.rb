module Commands
  module Event
    class Create < ROM::Commands::Create[:sql]
      relation :events
      register_as :create
      result :one
    end
  end
end
