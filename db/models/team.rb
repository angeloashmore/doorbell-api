class Team
  include Virtus.value_object

  values do
    attribute :name, String
    attribute :email, String

    attribute :created_at, Time
    attribute :updated_at, Time
  end
end
