class User
  include Virtus.value_object
  include Canable::Cans

  values do
    attribute :id, String, writable: false
  end
end
