class User
  include Virtus.value_object
  include Canable::Cans
  include Canable::Ables

  values do
    attribute :id, Integer, writer: :private

    attribute :remote_id, String, writer: :private

    attribute :email, String, writer: :private
    attribute :name, String, writer: :private

    attribute :created_at, Time, default: Time.now, writer: :private
    attribute :updated_at, Time, default: Time.now, writer: :private
  end

  def updatable_by?(user)
    id == user.id
  end

  def deletable_by?(user)
    false
  end
end
