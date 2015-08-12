class Team
  include Virtus.value_object
  include Canable::Ables

  values do
    attribute :id, Integer, writer: :private

    attribute :name, String, writer: :private
    attribute :email, String, writer: :private

    attribute :created_at, DateTime, default: Time.now, writer: :private
    attribute :updated_at, DateTime, default: Time.now, writer: :private
  end

  def viewable_by?(user)
    !_team_member_for_user(user).nil?
  end

  def updatable_by?(user)
    roles_mask = _roles_mask_for_user(user)
    roles_mask.get(:owner) || roles_mask.get(:admin)
  end

  def deletable_by?(user)
    _roles_mask_for_user(user).get(:owner)
  end

  private

  def _team_member_for_user(user)
    team_members = ROM.env.relation(:team_members).for_team(id: id).as(:entity)
    team_members.for_user(id: user.id).one
  end

  def _roles_mask_for_user(user)
    team_member = _team_member_for_user(user)
    Bitmask.new(TeamMember.roles, team_member.roles_mask)
  end
end
