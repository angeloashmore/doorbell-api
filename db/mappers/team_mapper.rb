module Mappers
  class TeamEntity < ROM::Mapper
    register_as :entity
    relation :teams

    model Team
  end
end
