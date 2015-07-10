module Commands
  module User
    class Delete < ROM::Commands::Delete[:sql]
      relation :users
      register_as :delete
      result :one
    end
  end
end
