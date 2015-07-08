class Team
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :name, String
    attribute :email, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end
end
