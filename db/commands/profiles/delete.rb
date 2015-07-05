module Commands
  module Profile
    class Delete < ROM::Commands::Delete[:sql]
      relation :profiles
      register_as :delete
      result :one
    end
  end
end
