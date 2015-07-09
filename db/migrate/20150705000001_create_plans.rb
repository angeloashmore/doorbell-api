ROM::SQL.migration do
  up do
    create_table(:plans) do
      primary_key :id

      String :stripe_plan_id, null: false

      String :name, null: false
      String :type, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    pgt_created_at(:plans, :created_at)
    pgt_updated_at(:plans, :updated_at)
  end

  down do
    drop_trigger(:plans, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_plans__updated_at", if_exists: true)

    drop_trigger(:plans, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_plans__created_at", if_exists: true)

    drop_table(:plans)
  end
end
