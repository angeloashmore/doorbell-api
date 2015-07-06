module Relations
  class Events < ROM::Relation[:sql]
    register_as :events
    dataset :events

    def by_id(id)
      where(id: id)
    end
  end
end
