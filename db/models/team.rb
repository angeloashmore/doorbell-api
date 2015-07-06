class Team
  include Virtus.value_object

  values do
    attribute :id, Integer

    attribute :name, String
    attribute :email, String

    attribute :created_at, Time, default: proc { DateTime.now }
    attribute :updated_at, Time, default: proc { DateTime.now }
  end
end
