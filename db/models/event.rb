class Event
  include Virtus.value_object

  values do
    attribute :user_id, Integer

    attribute :location, Hash
    attribute :description, String
    attribute :notes, String

    attribute :created_at, Time
    attribute :updated_at, Time
  end
end
