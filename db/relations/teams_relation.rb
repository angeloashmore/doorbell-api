module Relations
  class Teams < ROM::Relation[:sql]
    register_as :teams
    dataset :teams

    def by_id(id)
      where(id: id)
    end
  end
end
