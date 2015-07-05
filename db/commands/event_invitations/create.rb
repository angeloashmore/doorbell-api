module Commands
  module EventInvitation
    class Create < ROM::Commands::Create[:sql]
      relation :event_invitations
      register_as :create
      result :one
    end
  end
end
