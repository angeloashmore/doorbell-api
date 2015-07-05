class User
  include Virtus.model

  attribute :email, String
  attribute :password_hash, String
  attribute :email_verified, Boolean, default: false

  attribute :name, String
  attribute :professional, Boolean, default: false

  attribute :created_at, Time
  attribute :updated_at, Time
end