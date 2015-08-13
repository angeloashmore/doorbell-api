module Relations
  class Billings < ROM::Relation[:rethinkdb]
    include RethinkDB::Shortcuts

    register_as :billings
    dataset :billings

    def by_id(id)
      filter(id: id)
    end

    def for_relation(relation)
      type = relation.class.to_s.underscore
      filter(relation_type: type, relation_id: relation[:id])
    end
  end
end
