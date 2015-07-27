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
    roles.map { |r| r.user_id }.include?(user.id)
  end

  def updatable_by?(user)
    role_names = roles.select { |r| r.user_id == user.id }.map { |r| r.name }
    !(role_names & ['owner', 'admin']).empty?
  end

  def deletable_by?(user)
    roles.select { |r| r.user_id == user.id }.map { |r| r.name }.include?('owner')
  end
end
