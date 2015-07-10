module Mappers
  class UserEntity < ROM::Mapper
    register_as :entity
    relation :users

    model User
  end
end
