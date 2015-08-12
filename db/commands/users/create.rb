module Commands
  module User
    class Create < ROM::Commands::Create[:rethinkdb]
      relation :users
      register_as :create
      result :one
    end
  end
end
