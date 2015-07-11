ROM::SQL.migration do
  up do
    create_table(:roles) do
      primary_key :id

      foreign_key :team_id, :teams, null: false, index: true, on_delete: :cascade
      foreign_key :user_id, :users, null: false, index: true, on_delete: :cascade

      String :name, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    pgt_created_at(:roles, :created_at)
    pgt_updated_at(:roles, :updated_at)
  end

  down do
    drop_trigger(:roles, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_roles__updated_at", if_exists: true)

    drop_trigger(:roles, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_roles__created_at", if_exists: true)

    drop_table(:roles)
  end
end
