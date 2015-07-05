module Commands
  module Profile
    class Create < ROM::Commands::Create[:sql]
      relation :profiles
      register_as :create
      result :one
    end
  end
end
