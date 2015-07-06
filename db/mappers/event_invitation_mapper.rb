module Mappers
  class EventInvitationEntity < ROM::Mapper
    register_as :entity
    relation :event_invitations

    model EventInvitation
  end
end
