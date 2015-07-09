ROM::SQL.migration do
  up do
    create_table(:event_invitations) do
      primary_key :id

      foreign_key :event_id, :events, null: false, index: true, on_delete: :cascade

      String :user_id, null: false, index: true

      Boolean :accepted, null: false, default: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    pgt_created_at(:event_invitations, :created_at)
    pgt_updated_at(:event_invitations, :updated_at)
  end

  down do
    drop_trigger(:event_invitations, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_event_invitations__updated_at", if_exists: true)

    drop_trigger(:event_invitations, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_event_invitations__created_at", if_exists: true)

    drop_table(:event_invitations)
  end
end
