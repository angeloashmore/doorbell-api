module Relations
  class Plans < ROM::Relation[:rethinkdb]
    register_as :plans
    dataset :plans

    def by_id(id)
      where(id: id)
    end

    def default(type)
      where(name: 'Default').where(type: type.to_s)
    end
  end
end
