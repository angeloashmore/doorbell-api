class Role
  include Virtus.value_object

  NAMES = ['owner', 'admin', 'billing', 'member'].freeze

  values do
    attribute :id, Integer, writer: :private

    attribute :team_id, Integer
    attribute :user_id, Integer

    attribute :name, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end

  def self.names
    NAMES
  end

  def viewable_by?(user)
    return true if user_id == user.id

    roles = ROM.env.relation(:roles).for_team(id: team_id).for_user(user).as(:entity).to_a
    !roles.empty?
  end

  def creatable_by?(user)
    roles = ROM.env.relation(:roles).for_team(id: team_id).for_user(user).as(:entity).to_a
    role_names = roles.map { |r| r.name }
    !(role_names & ['owner', 'admin']).empty?
  end

  def updatable_by?(user)
    roles = ROM.env.relation(:roles).for_team(id: team_id).for_user(user).as(:entity).to_a
    role_names = roles.map { |r| r.name }
    !(role_names & ['owner', 'admin']).empty?
  end

  def deletable_by?(user)
    roles = ROM.env.relation(:roles).for_team(id: team_id).for_user(user).as(:entity).to_a
    role_names = roles.map { |r| r.name }
    !(role_names & ['owner', 'admin']).empty?
  end
end
