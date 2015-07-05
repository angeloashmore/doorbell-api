class Profile
  include Virtus.value_object

  values do
    attribute :user_id, Integer
    attribute :team_id, Integer

    attribute :title, String
    attribute :private, Boolean, default: false

    attribute :created_at, Time
    attribute :updated_at, Time
  end
end
