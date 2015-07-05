ROM::SQL.migration do
  change do
    create_table(:teams) do
      primary_key :id
      String :name, null: false
      String :email, null: false

      index :email, unique: true
    end
  end
end
