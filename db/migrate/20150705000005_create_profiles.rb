ROM::SQL.migration do
  up do
    create_table(:profiles) do
      primary_key :id

      foreign_key :team_id, :teams, null: false, index: true, on_delete: :cascade
      foreign_key :user_id, :users, null: false, index: true, on_delete: :cascade

      String :title
      Boolean :private, null: false, default: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    pgt_created_at(:profiles, :created_at)
    pgt_updated_at(:profiles, :updated_at)
  end

  down do
    drop_trigger(:profiles, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_profiles__updated_at", if_exists: true)

    drop_trigger(:profiles, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_profiles__created_at", if_exists: true)

    drop_table(:profiles)
  end
end
