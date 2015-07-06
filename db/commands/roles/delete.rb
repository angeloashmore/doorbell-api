module Commands
  module Role
    class Delete < ROM::Commands::Delete[:sql]
      relation :roles
      register_as :delete
      result :one
    end
  end
end
