class Billing
  include Virtus.value_object

  values do
    attribute :user_id, Integer
    attribute :team_id, Integer

    attribute :plan_id, Plan

    attribute :stripe_customer_id, String
    attribute :email, String

    attribute :brand, String
    attribute :last4, String
    attribute :exp_month, String
    attribute :exp_year, String

    attribute :created_at, Time
    attribute :updated_at, Time
  end
end
