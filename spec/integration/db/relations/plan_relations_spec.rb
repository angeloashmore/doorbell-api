require 'spec_helper'

describe Relations::Plans do
  let(:plans) { ROM.env.relation(:plans).as(:entity) }

  before :all do
    command = ROM.env.command(:plans).as(:entity).create
    @plan = command.call(name: 'Plan', type: 'user')
  end

  describe '::by_id' do
    it 'should return the team' do
      expect(plans.by_id(@plan.id).one).to eql(@plan)
    end
  end

  describe '::default' do
    it 'should return the default plan for teams' do
      plan = plans.default(:team).to_a
      expect(plan.size).to eq(1)
      expect(plan.first.name).to eq('Default')
      expect(plan.first.type).to eq('team')
    end

    it 'should return the default plan for users' do
      plan = plans.default(:user).to_a
      expect(plan.size).to eq(1)
      expect(plan.first.name).to eq('Default')
      expect(plan.first.type).to eq('user')
    end
  end
end
