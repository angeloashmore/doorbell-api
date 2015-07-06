module Mappers
  class RoleEntity < ROM::Mapper
    register_as :entity
    relation :roles

    model Role

    fold :names do
      attribute :name
    end
  end
end
