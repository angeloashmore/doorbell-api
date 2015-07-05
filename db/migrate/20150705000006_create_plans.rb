ROM::SQL.migration do
  change do
    create_table(:plans) do
      primary_key :id

      String :name, null: false
      String :stripe_plan_id, null: false
      String :type, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
