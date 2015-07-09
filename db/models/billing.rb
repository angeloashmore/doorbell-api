class Billing
  include Virtus.value_object
  include Canable::Ables

  values do
    attribute :id, Integer, writer: :private

    attribute :plan_id, Integer
    attribute :user_id, String
    attribute :team_id, Integer

    attribute :stripe_customer_id, String
    attribute :email, String

    attribute :brand, String
    attribute :last4, String
    attribute :exp_month, String
    attribute :exp_year, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end

  def type
    return :user if !user_id.nil?
    return :team if !team_id.nil?
    fail UnknownTypeError
  end

  def viewable_by?(user)
    case type
    when :user
      user_id == user.id
    when :team
      roles = ROM.env.relation(:roles).as(:entity).for_team(team_id).for_user(user.id)
      !roles.to_a.empty?
    else
      false
    end
  end

  def updatable_by?(user)
    case type
    when :user
      user_id == user.id
    when :team
      roles = ROM.env.relation(:roles).as(:entity).for_team(team_id).for_user(user.id)
      role_names = roles.to_a.map { |r| r.name }
      !(role_names & ['owner', 'billing']).empty?
    else
      false
    end
  end

  def deletable_by?(user)
    false
  end
end
