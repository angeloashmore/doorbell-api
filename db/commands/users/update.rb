module Commands
  module User
    class Update < ROM::Commands::Update[:sql]
      relation :users
      register_as :update
      result :one
    end
  end
end
