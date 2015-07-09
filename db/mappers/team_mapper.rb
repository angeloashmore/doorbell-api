module Mappers
  class TeamEntity < ROM::Mapper
    register_as :entity
    relation :teams

    model Team
  end

  class TeamEntityWithRoles < ROM::Mapper
    register_as :entity_with_roles
    relation :teams

    model Team

    combine :roles, on: { id: :team_id } do
      model Role
    end
  end
end
