class Profile
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :user_id, String
    attribute :team_id, Integer

    attribute :title, String
    attribute :private, Boolean

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end
end
