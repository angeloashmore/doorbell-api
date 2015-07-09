class Plan
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :name, String
    attribute :type, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end

  def stripe_plan_id
    underscore = -> (s) { s.gsub(' ', '_').upcase }

    type = underscore.call(type)
    name = underscore.call(name)

    "#{type}__#{name}"
  end

  def self.default_for(type)
    case type
    when :user
      return ROM.env.relation(:plans).as(:entity).default(:user).one
    when :team
      return ROM.env.relation(:plans).as(:entity).default(:team).one
    end
  end
end
