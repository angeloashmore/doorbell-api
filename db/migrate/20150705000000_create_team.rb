ROM::SQL.migration do
  change do
    create_table(:teams) do
      primary_key :id
      String :name, null: false
      String :email, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
