require 'spec_helper'

describe Team do
  before :all do
    email = 'name@example.com'

    @user = Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: email)
    @other_user = Doorbell::Mutation::Users::Create.run!(remote_id: 2, email: email)

    @owner_user = Doorbell::Mutation::Users::Create.run!(remote_id: 3, email: email)
    @admin_user = Doorbell::Mutation::Users::Create.run!(remote_id: 4, email: email)
    @member_user = Doorbell::Mutation::Users::Create.run!(remote_id: 5, email: email)

    @team = Doorbell::Mutation::Teams::Create.run!(user: @owner_user, name: 'Name', email: email)

    Doorbell::Mutation::TeamMembers::Create.run!(user: @admin_user, team: @team, roles: { admin: true })
    Doorbell::Mutation::TeamMembers::Create.run!(user: @member_user, team: @team)
  end

  describe '#viewable_by?' do
    it 'should be true for team members' do
      expect(@team.viewable_by?(@user)).to be false
      expect(@team.viewable_by?(@owner_user)).to be true
    end
  end

  describe '#creatable_by?' do
    it 'should be true for anyone' do
      expect(Team.new.creatable_by?(@user)).to be true
    end
  end

  describe '#updatable_by?' do
    it 'should be true for team members with the owner or admin role' do
      expect(@team.updatable_by?(@user)).to be false
      expect(@team.updatable_by?(@owner_user)).to be true
      expect(@team.updatable_by?(@admin_user)).to be true
      expect(@team.updatable_by?(@member_user)).to be false
    end
  end

  describe '#deletable_by?' do
    it 'should be true for team members with the owner role' do
      expect(@team.deletable_by?(@user)).to be false
      expect(@team.deletable_by?(@owner_user)).to be true
      expect(@team.deletable_by?(@admin_user)).to be false
      expect(@team.deletable_by?(@member_user)).to be false
    end
  end
end
