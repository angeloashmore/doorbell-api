class EventInvitation
  include Virtus.value_object

  values do
    attribute :event_id, Integer
    attribute :user_id, Integer

    attribute :accepted, Boolean, default: false

    attribute :created_at, Time
    attribute :updated_at, Time
  end
end
