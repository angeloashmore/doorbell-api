module Mappers
  class EventEntity < ROM::Mapper
    register_as :entity
    relation :events

    model Event
  end
end
