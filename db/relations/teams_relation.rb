class TeamsRelation < ROM::Relation[:sql]
  dataset :teams

  def by_id(id)
    where(id: id)
  end
end
