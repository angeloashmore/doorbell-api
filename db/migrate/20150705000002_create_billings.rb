ROM::SQL.migration do
  change do
    create_table(:billings) do
      primary_key :id

      Integer :user_id
      Integer :team_id
      Integer :plan_id, null: false

      String :stripe_customer_id, null: false

      String :brand
      String :last4
      String :exp_month
      String :exp_year

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
