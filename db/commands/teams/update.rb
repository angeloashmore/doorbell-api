module TeamCommands
  class Update < ROM::Commands::Update[:sql]
    relation :teams
    register_as :update
    result :one
  end
end
