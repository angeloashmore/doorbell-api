module TeamCommands
  class Delete < ROM::Commands::Delete[:sql]
    relation :teams
    register_as :delete
    result :one
  end
end
