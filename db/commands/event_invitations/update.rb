module Commands
  module EventInvitation
    class Update < ROM::Commands::Update[:sql]
      relation :event_invitations
      register_as :update
      result :one
    end
  end
end
