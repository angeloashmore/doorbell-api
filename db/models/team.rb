class Team
  include Virtus.value_object
  include Canable::Ables

  values do
    attribute :id, Integer, writer: :private

    attribute :name, String
    attribute :email, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end

  def viewable_by?(user)
    roles = ROM.env.relation(:roles).as(:entity).for_team(id).for_user(user.id)
    !roles.to_a.empty?
  end

  def updatable_by?(user)
    roles = ROM.env.relation(:roles).as(:entity).for_team(id).for_user(user.id)
    role_names = roles.to_a.map { |r| r.name }
    !(role_names & ["owner", "admin"]).empty?
  end

  def deletable_by?(user)
    roles = ROM.env.relation(:roles).as(:entity).for_team(id).for_user(user.id)
    role_names = roles.to_a.map { |r| r.name }
    role_names.include?("owner")
  end
end
