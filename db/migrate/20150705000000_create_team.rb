ROM::SQL.migration do
  up do
    create_table(:teams) do
      primary_key :id
      String :name, null: false
      String :email, null: false

      DateTime :created_at
      DateTime :updated_at
    end

    pgt_created_at(:teams, :created_at)
    pgt_updated_at(:teams, :updated_at)
  end

  down do
    drop_trigger(:teams, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_teams__updated_at", if_exists: true)

    drop_trigger(:teams, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_teams__created_at", if_exists: true)

    drop_table(:teams)
  end
end
