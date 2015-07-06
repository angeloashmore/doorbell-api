module Relations
  class Profiles < ROM::Relation[:sql]
    register_as :profiles
    dataset :profiles

    def by_id(id)
      where(id: id)
    end
  end
end
