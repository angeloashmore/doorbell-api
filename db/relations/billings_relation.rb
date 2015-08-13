module Relations
  class Billings < ROM::Relation[:rethinkdb]
    include RethinkDB::Shortcuts

    register_as :billings
    dataset :billings

    def by_id(id)
      filter(id: id)
    end

    def by_ids(ids)
      filter { |doc| r.expr(ids).contains(doc[:id])}
    end

    def for_relation(relation)
      type = relation.class.to_s.underscore
      filter(relation_type: type, relation_id: relation[:id])
    end

    def for_relations(relations)
      ids = relations.map { |r| r[:id] }
      filter { |doc| r.expr(ids).contains(doc[:id])}
    end

    def for_type(type)
      filter(relation_type: type.to_s)
    end

    def for_types(types)
      filter { |doc| r.expr(types.map(&:to_s)).contains(doc[:type])}
    end
  end
end
