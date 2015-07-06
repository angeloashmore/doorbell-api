module Relations
  class EventInvitations < ROM::Relation[:sql]
    register_as :event_invitations
    dataset :event_invitations

    def by_id(id)
      where(id: id)
    end
  end
end
