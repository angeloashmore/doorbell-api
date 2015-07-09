module Relations
  class Plans < ROM::Relation[:sql]
    register_as :plans
    dataset :plans

    def by_id(id)
      where(id: id)
    end

    def by_stripe_plan_id(stripe_plan_id)
      where(stripe_plan_id: stripe_plan_id)
    end
  end
end
