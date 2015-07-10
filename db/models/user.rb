class User
  include Virtus.value_object
  include Canable::Cans

  values do
    attribute :id, Integer, writable: false

    attribute :remote_id, String, writable: false

    attribute :name, String
    attribute :email, String

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
