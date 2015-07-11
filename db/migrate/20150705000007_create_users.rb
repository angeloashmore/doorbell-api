ROM::SQL.migration do
  up do
    create_table(:users) do
      primary_key :id

      String :remote_id, null: false, index: true, unique: true

      String :email, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    pgt_created_at(:users, :created_at)
    pgt_updated_at(:users, :updated_at)
  end

  down do
    drop_trigger(:users, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_users__updated_at", if_exists: true)

    drop_trigger(:users, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_users__created_at", if_exists: true)

    drop_table(:users)
  end
end
