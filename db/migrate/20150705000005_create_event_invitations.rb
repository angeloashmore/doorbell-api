ROM::SQL.migration do
  change do
    create_table(:event_invitations) do
      primary_key :id

      Integer :event_id, null: false
      Integer :user_id, null: false

      Boolean :accepted, null: false, default: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
