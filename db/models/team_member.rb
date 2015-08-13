class TeamMember
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :user_id, Integer, writer: :private
    attribute :team_id, Integer, writer: :private

    attribute :title, String, writer: :private
    attribute :email, String, writer: :private
    attribute :private, Boolean, default: false, writer: :private

    attribute :roles_mask, Integer, writer: :private

    attribute :created_at, Time, default: Time.now, writer: :private
    attribute :updated_at, Time, default: Time.now, writer: :private
  end

  # NEVER modify the values!
  # NEVER modify the values!
  # NEVER modify the values!
  # You may, however, add values with a unique value.
  def self.roles
    {
      owner:   0b0001,
      admin:   0b0010,
      billing: 0b0100
    }
  end

  def viewable_by?(user)
    return true if user_id == user.id

    !_team_member_for_user(user).nil?
  end

  def creatable_by?(user)
    _if_owner_or_admin(user)
  end

  def updatable_by?(user)
    return true if user_id == user.id
    _if_owner_or_admin(user)
  end

  def deletable_by?(user)
    _if_owner_or_admin(user)
  end

  private

  def _team_member_for_user(user)
    team_members = ROM.env.relation(:team_members).for_team(id: team_id).as(:entity)
    team_member = team_members.for_user(id: user.id).one
  end

  def _roles_mask_for_user(user)
    team_member = _team_member_for_user(user)
    roles_mask = team_member.nil? ? 0 : team_member.roles_mask
    Bitmask.new(TeamMember.roles, roles_mask)
  end

  def _if_owner_or_admin(user)
    roles_mask = _roles_mask_for_user(user)
    roles_mask.get(:owner) || roles_mask.get(:admin)
  end
end
