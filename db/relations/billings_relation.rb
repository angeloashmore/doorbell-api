module Relations
  class Billings < ROM::Relation[:sql]
    register_as :billings
    dataset :billings

    def by_ids(ids)
      where(id: Array.wrap(ids))
    end
    alias_method :by_id, :by_ids

    def for_relations(relations)
      where(relation_id: Array.wrap(relations).map { |r| r[:id] })
    end
    alias_method :for_relation, :for_relations

    def for_types(types)
      where(relation_type: Array.wrap(types).map { |t| t.to_s })
    end
    alias_method :for_type, :for_types

    def for_teams_accessible_by_users(users)
      qualified
        .where(relation_type: 'team')
        .inner_join(:team_members, :team_id => :relation_id)
        .where(team_members__user_id: Array.wrap(users).map { |u| u[:id] })
        .group(:billings__id)
    end
    alias_method :for_teams_accessible_by_user, :for_teams_accessible_by_users
  end
end
