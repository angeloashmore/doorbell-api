module Mappers
  class PlanEntity < ROM::Mapper
    register_as :entity
    relation :plans

    model Plan
  end
end
