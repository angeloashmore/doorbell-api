module Commands
  module Billing
    class Create < ROM::Commands::Create[:rethinkdb]
      relation :billings
      register_as :create
      result :one
    end
  end
end
