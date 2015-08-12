module Relations
  class Plans < ROM::Relation[:rethinkdb]
    register_as :plans
    dataset :plans

    def by_id(id)
      filter(id: id)
    end

    def default(type)
      filter(name: 'Default', type: type.to_s)
    end
  end
end
