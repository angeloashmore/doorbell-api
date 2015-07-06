module Relations
  class Plans < ROM::Relation[:sql]
    register_as :plans
    dataset :plans

    def by_id(id)
      where(id: id)
    end
  end
end
