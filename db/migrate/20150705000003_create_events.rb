ROM::SQL.migration do
  change do
    create_table(:events) do
      primary_key :id

      Integer :user_id, null: false

      String :location
      String :description
      String :notes

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
