module Mappers
  class RoleEntity < ROM::Mapper
    register_as :entity
    relation :roles

    model Role
  end
end
