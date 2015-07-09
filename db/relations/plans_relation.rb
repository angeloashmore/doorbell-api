module Relations
  class Plans < ROM::Relation[:sql]
    register_as :plans
    dataset :plans

    def by_id(id)
      where(id: id)
    end

    def default(type)
      query = where(name: 'Default')

      case type
      when :user
        query = query.where(type: 'user')
      when :team
        query = query.where(type: 'team')
      else
        fail UnknownTypeError
      end

      query
    end
  end
end
