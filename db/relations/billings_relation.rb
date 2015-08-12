module Relations
  class Billings < ROM::Relation[:rethinkdb]
    register_as :billings
    dataset :billings

    def by_id(id)
      filter(id: id)
    end

    def by_ids(ids)
      filter { |doc| r.expr(ids).contains(doc[:id])}
    end

    def for_relation(relation)
      filter(relation_id: relation[:id])
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

    def for_teams_accessible_by_user(user)
      filter(relation_type: 'team')
        .eq_join(:team_id, r.table(:team_members).filter(user_id: user[:id]))
        .without(right: :id)
    end
  end
end
