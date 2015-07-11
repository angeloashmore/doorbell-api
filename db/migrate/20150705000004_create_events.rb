ROM::SQL.migration do
  up do
    create_table(:events) do
      primary_key :id

      foreign_key :user_id, :users, null: false, index: true, on_delete: :cascade

      String :location
      String :description
      String :notes

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    pgt_created_at(:events, :created_at)
    pgt_updated_at(:events, :updated_at)
  end

  down do
    drop_trigger(:events, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_events__updated_at", if_exists: true)

    drop_trigger(:events, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_events__created_at", if_exists: true)

    drop_table(:events)
  end
end
