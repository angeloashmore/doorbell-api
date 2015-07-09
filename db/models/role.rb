class Role
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :team_id, Integer
    attribute :user_id, String

    attribute :name, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end
end
