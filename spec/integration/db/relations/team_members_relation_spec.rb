require 'spec_helper'

describe Relations::TeamMembers do
  let(:team_members) { ROM.env.relation(:team_members).as(:entity) }

  before :all do
    email = 'name@example.com'
    @owner = Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: email)
    @team = Doorbell::Mutation::Teams::Create.run!(user: @owner, name: 'Name', email: email)
    @user = Doorbell::Mutation::Users::Create.run!(remote_id: 2, email: email)
    @team_member = Doorbell::Mutation::TeamMembers::Create.run!(user: @user, team: @team, roles: { billing: true })
  end

  describe '::by_id' do
    it 'should return the team member' do
      expect(team_members.by_id(@team_member.id).one).to eql(@team_member)
    end
  end

  describe '::for_user' do
    it 'should return all team members for the user' do
      expect(team_members.for_user(@user).to_a).to eql([@team_member])
    end
  end

  describe '::for_team' do
    it 'should return all team members for the team' do
      items = team_members.for_team(@team).to_a
      expect(items).to include(@team_member)
      expect(items.size).to eq(2)
    end
  end
end
