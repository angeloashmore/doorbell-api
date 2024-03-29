class User
  include Virtus.value_object
  include Canable::Cans
  include Canable::Ables

  values do
    attribute :id, Integer, writable: false

    attribute :remote_id, String, writable: false

    attribute :email, String
    attribute :name, String

    attribute :created_at, DateTime, writer: :private
    attribute :updated_at, DateTime, writer: :private
  end

  def updatable_by?(user)
    id == user.id
  end

  def deletable_by?(user)
    false
  end
end
