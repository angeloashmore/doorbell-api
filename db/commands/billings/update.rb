module Commands
  module Billing
    class Update < ROM::Commands::Update[:rethinkdb]
      relation :billings
      register_as :update
      result :one
    end
  end
end
