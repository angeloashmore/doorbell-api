ROM::SQL.migration do
  change do
    create_table(:profiles) do
      primary_key :id

      Integer :user_id, null: false
      Integer :team_id, null: false

      String :title
      Boolean :private, null: false, default: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
