module Commands
  module Plan
    class Create < ROM::Commands::Create[:sql]
      relation :plans
      register_as :create
      result :one
    end
  end
end
