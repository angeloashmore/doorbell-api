module Relations
  class Plans < ROM::Relation[:sql]
    def by_id(id)
      where(id: id)
    end
  end
end
