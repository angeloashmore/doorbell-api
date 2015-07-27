ROM::SQL.migration do
  up do
    create_table(:team_members) do
      primary_key :id

      foreign_key :team_id, :teams, null: false, index: true, on_delete: :cascade
      foreign_key :user_id, :users, null: false, index: true, on_delete: :cascade

      String :title
      String :email, null: false
      Boolean :private, null: false, default: false

      Integer :roles_mask, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    pgt_created_at(:team_members, :created_at)
    pgt_updated_at(:team_members, :updated_at)
  end

  down do
    drop_trigger(:team_members, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_team_members__updated_at", if_exists: true)

    drop_trigger(:team_members, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_team_members__created_at", if_exists: true)

    drop_table(:team_members)
  end
end
