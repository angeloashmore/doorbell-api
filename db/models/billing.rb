class Billing
  include Virtus.value_object
  include Canable::Ables

  values do
    attribute :id, Integer, writer: :private

    attribute :plan_id, Integer
    attribute :relation_type, String
    attribute :relation_id, Integer

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
    case relation_type
    when 'user'
      relation_id == user.id
    when 'team'
      !_team_member_for_user(user).nil?
    else
      false
    end
  end

  def creatable_by?(user)
    false
  end

  def updatable_by?(user)
    case relation_type
    when 'user'
      relation_id == user.id
    when 'team'
      roles_mask = _roles_mask_for_user(user)
      roles_mask.get(:owner) || roles_mask.get(:billing)
    else
      false
    end
  end

  def deletable_by?(user)
    false
  end

  private

  def _team_member_for_user(user)
    team_members = ROM.env.relation(:team_members).for_team(id: relation_id).as(:entity)
    team_members.for_user(id: user.id).one
  end

  def _roles_mask_for_user(user)
    team_member = _team_member_for_user(user)
    Bitmask.new(TeamMember.roles, team_member.roles_mask)
  end
end
