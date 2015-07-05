module Commands
  module Event
    class Update < ROM::Commands::Update[:sql]
      relation :events
      register_as :update
      result :one
    end
  end
end
