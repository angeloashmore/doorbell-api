module Commands
  module Billing
    class Create < ROM::Commands::Create[:sql]
      relation :billings
      register_as :create
      result :one
    end
  end
end
