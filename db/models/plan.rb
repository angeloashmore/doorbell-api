class Plan
  include Virtus.value_object

  values do
    attribute :stripe_plan_id, String

    attribute :name, String
    attribute :type, String

    attribute :created_at, Time
    attribute :updated_at, Time
  end
end
