ROM::SQL.migration do
  change do
    create_table(:roles) do
      primary_key :id

      String :resource_type, null: false
      Integer :resource_id, null: false

      Integer :user_id, null: false

      String :name, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
