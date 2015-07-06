module Mappers
  class BillingEntity < ROM::Mapper
    register_as :entity
    relation :billings

    model Billing
  end
end
