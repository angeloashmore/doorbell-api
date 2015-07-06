module Mappers
  class ProfileEntity < ROM::Mapper
    register_as :entity
    relation :profiles

    model Profile
  end
end
