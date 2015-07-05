ROM::SQL.migration do
  change do
    create_table(:profiles) do
      primary_key :id

      Integer :user_id, null: false
      Integer :team_id, null: false

      String :title
      Boolean :private, null: false, default: false
    end
  end
end
