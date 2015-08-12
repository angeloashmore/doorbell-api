module Commands
  module Plan
    class Create < ROM::Commands::Create[:rethinkdb]
      relation :plans
      register_as :create
      result :one
    end
  end
end
