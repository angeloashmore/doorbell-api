module Commands
  module Role
    class Create < ROM::Commands::Create[:sql]
      relation :roles
      register_as :create
      result :one
    end
  end
end
