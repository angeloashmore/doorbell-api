class User
  include Virtus.value_object

  values do
    attribute :email, String
    attribute :password_hash, String

    attribute :email_verified, Boolean, default: false
    attribute :name, String
    attribute :professional, Boolean, default: false

    attribute :created_at, DateTime
    attribute :updated_at, DateTime
  end
end
