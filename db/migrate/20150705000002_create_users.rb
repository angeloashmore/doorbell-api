ROM::SQL.migration do
  change do
    create_table(:users) do
      primary_key :id

      String :email, null: false
      String :password_hash, null: false

      Boolean :email_verified, null: false, default: false
      String :name, null: false
      Boolean :professional, null: false, default: false

      Boolean :private, null: false, default: false
    end
  end
end
