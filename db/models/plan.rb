class Plan
  include Virtus.value_object
  include Canable::Ables

  values do
    attribute :id, Integer, writer: :private

    attribute :name, String
    attribute :type, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end

  def stripe_plan_id
    "#{type}__#{name}".gsub(' ', '_').upcase
  end

  def self.default_for(type)
    case type
    when :user
      return ROM.env.relation(:plans).as(:entity).default(:user).one
    when :team
      return ROM.env.relation(:plans).as(:entity).default(:team).one
    end
  end

  def creatable_by?(user)
    false
  end

  def updatable_by?(user)
    false
  end

  def deletable_by?(user)
    false
  end
end
