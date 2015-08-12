module Commands
  module Billing
    class Delete < ROM::Commands::Delete[:rethinkdb]
      relation :billings
      register_as :delete
      result :one
    end
  end
end
