class TeamMember
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :user_id, Integer
    attribute :team_id, Integer

    attribute :title, String
    attribute :email, String
    attribute :private, Boolean

    attribute :roles_mask, Integer, writer: :private

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
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

    roles = ROM.env.relation(:roles).for_team(id: team_id).as(:entity)
    roles.to_a.map { |r| r.user_id }.include?(user.id)
  end

  def creatable_by?(user)
    false
  end

  def updatable_by?(user)
    user_id == user.id
  end

  def deletable_by?(user)
    false
  end
end
