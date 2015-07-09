class Profile
  include Virtus.value_object

  values do
    attribute :id, Integer, writer: :private

    attribute :user_id, String
    attribute :team_id, Integer

    attribute :title, String
    attribute :private, Boolean

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end

  def viewable_by?(user)
    return true if user_id == user

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
