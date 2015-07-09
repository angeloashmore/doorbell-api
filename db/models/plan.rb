class Plan
  include Virtus.value_object

  values do
    attribute :stripe_plan_id, String

    attribute :name, String
    attribute :type, String

    attribute :created_at, Time
    attribute :updated_at, Time
  end

  def self.default_plan(type)
    case type
    when :user
      return ROM.env.relation(:plans).as(:entity).by_stripe_plan_id('USER__FREE').one
    when :team
      return ROM.env.relation(:plans).as(:entity).by_stripe_plan_id('TEAM__FREE').one
    end
  end
end