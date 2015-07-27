module Mappers
  class TeamMemberEntity < ROM::Mapper
    register_as :entity
    relation :team_members

    model TeamMember
  end
end
