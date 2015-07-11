ROM::SQL.migration do
  up do
    create_table(:billings) do
      primary_key :id

      foreign_key :plan_id, :plans, null: false, index: true, on_delete: :set_null

      String :relation_type, null: false
      Integer :relation_id, null: false, index: true

      String :stripe_customer_id, null: false
      String :email, null: false

      String :brand
      String :last4
      String :exp_month
      String :exp_year

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    pgt_created_at(:billings, :created_at)
    pgt_updated_at(:billings, :updated_at)
  end

  down do
    drop_trigger(:billings, "pgt_ua_updated_at", if_exists: true)
    drop_function("pgt_ua_billings__updated_at", if_exists: true)

    drop_trigger(:billings, "pgt_ca_created_at", if_exists: true)
    drop_function("pgt_ca_billings__created_at", if_exists: true)

    drop_table(:billings)
  end
end
