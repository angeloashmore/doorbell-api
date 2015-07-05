module Commands
  module Profile
    class Update < ROM::Commands::Update[:sql]
      relation :profiles
      register_as :update
      result :one
    end
  end
end
