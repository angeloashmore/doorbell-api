module Mappers
  class Role < ROM::Mapper
    relation :roles

    model Role

    fold :names do
      attribute :name
    end
  end
end
