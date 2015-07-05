module Commands
  module Billing
    class Update < ROM::Commands::Update[:sql]
      relation :billings
      register_as :update
      result :one
    end
  end
end
