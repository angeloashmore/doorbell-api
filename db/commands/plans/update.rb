module Commands
  module Plan
    class Update < ROM::Commands::Update[:sql]
      relation :plans
      register_as :update
      result :one
    end
  end
end
