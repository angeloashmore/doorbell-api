module Commands
  module Plan
    class Delete < ROM::Commands::Delete[:sql]
      relation :plans
      register_as :delete
      result :one
    end
  end
end
