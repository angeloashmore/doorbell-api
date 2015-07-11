class EventInvitation
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :event_id, Integer
    attribute :user_id, Integer

    attribute :accepted, Boolean

    attribute :created_at, DateTime
    attribute :updated_at, DateTime
  end
end
