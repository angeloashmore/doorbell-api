module Relations
  class Billings < ROM::Relation[:sql]
    register_as :billings
    dataset :billings

    def by_id(id)
      where(id: id)
    end
  end
end
