require 'spec_helper'

describe Billing do

  before :all do
    email = 'name@example.com'

    @user = Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: email)
    @other_user = Doorbell::Mutation::Users::Create.run!(remote_id: 2, email: email)

    @owner_user = Doorbell::Mutation::Users::Create.run!(remote_id: 3, email: email)
    @billing_user = Doorbell::Mutation::Users::Create.run!(remote_id: 4, email: email)
    @member_user = Doorbell::Mutation::Users::Create.run!(remote_id: 5, email: email)

    @team = Doorbell::Mutation::Teams::Create.run!(user: @owner_user, name: 'Name', email: email)

    Doorbell::Mutation::TeamMembers::Create.run!(user: @billing_user, team: @team, roles: { billing: true })
    Doorbell::Mutation::TeamMembers::Create.run!(user: @member_user, team: @team)
  end

  describe '#viewable_by?' do
    describe 'for a user' do
      it 'should be true only for its user' do
        billing = ROM.env.relation(:billings).for_type(:user).for_relation(@user).as(:entity).one

        expect(billing.viewable_by?(@user)).to be true
        expect(billing.viewable_by?(@other_user)).to be false
      end
    end

    describe 'for a team' do
      it 'should be true only for team members' do
        billing = ROM.env.relation(:billings).for_type(:team).for_relation(@team).as(:entity).one

        expect(billing.viewable_by?(@user)).to be false
        expect(billing.viewable_by?(@owner_user)).to be true
        expect(billing.viewable_by?(@billing_user)).to be true
        expect(billing.viewable_by?(@member_user)).to be true
      end
    end
  end

  describe '#creatable_by?' do
    it 'should be false for everyone' do
      expect(Billing.new.creatable_by?(@user)).to be false
    end
  end

  describe '#updatable_by?' do
    describe 'for a user' do
      it 'should be true only for its user' do
        billing = ROM.env.relation(:billings).for_type(:user).for_relation(@user).as(:entity).one

        expect(billing.updatable_by?(@user)).to be true
        expect(billing.updatable_by?(@other_user)).to be false
      end
    end

    describe 'for a team' do
      it 'should be true only for team members with the owner or billing role' do
        billing = ROM.env.relation(:billings).for_type(:team).for_relation(@team).as(:entity).one

        expect(billing.updatable_by?(@user)).to be false
        expect(billing.updatable_by?(@owner_user)).to be true
        expect(billing.updatable_by?(@billing_user)).to be true
        expect(billing.updatable_by?(@member_user)).to be false
      end
    end
  end

  describe '#deletable_by?' do
    it 'should be false for everyone' do
      expect(Billing.new.deletable_by?(@user)).to be false
    end
  end
end
