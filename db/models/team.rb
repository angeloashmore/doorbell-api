ValueObject = Virtus.value_object(coerce: false)

class Team
  include ValueObject

  values do
    attribute :name, String
    attribute :email, String

    attribute :created_at, Time
    attribute :updated_at, Time
  end
end
