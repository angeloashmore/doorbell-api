module Commands
  module User
    class Delete < ROM::Commands::Delete[:rethinkdb]
      relation :users
      register_as :delete
      result :one
    end
  end
end
