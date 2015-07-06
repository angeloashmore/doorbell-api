module Commands
  module Role
    class Update < ROM::Commands::Update[:sql]
      relation :roles
      register_as :update
      result :one
    end
  end
end
