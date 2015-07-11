class Event
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :user_id, Integer

    attribute :location, Hash
    attribute :description, String
    attribute :notes, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end
end
