require 'spec_helper'

describe Relations::Teams do
  let(:teams) { ROM.env.relation(:teams).as(:entity) }

  before :all do
    email = 'name@example.com'
    @owner = Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: email)
    @team = Doorbell::Mutation::Teams::Create.run!(user: @owner, name: 'Name', email: email)
  end

  describe '::by_id' do
    it 'should return the team' do
      expect(teams.by_id(@team.id).one).to eql(@team)
    end
  end
end
