module TeamCommands
  class Create < ROM::Commands::Create[:sql]
    relation :teams
    register_as :create
    result :one
  end
end
