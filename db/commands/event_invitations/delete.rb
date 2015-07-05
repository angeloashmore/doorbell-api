module Commands
  module EventInvitation
    class Delete < ROM::Commands::Delete[:sql]
      relation :event_invitations
      register_as :delete
      result :one
    end
  end
end
