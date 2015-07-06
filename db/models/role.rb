class Role
  include Virtus.value_object

  values do
    attribute :id, String, writer: :private

    attribute :resource_type, String
    attribute :resource_id, Integer

    attribute :user_id, Integer

    attribute :names, Array[String]

    attribute :created_at, Time, writer: :private
    attribute :updated_at, Time, writer: :private
  end
end
