require 'spec_helper'

describe Relations::Users do
  let(:users) { ROM.env.relation(:users).as(:entity) }

  before :all do
    @email = 'name@example.com'
    @user = Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: @email)
    @other_user = Doorbell::Mutation::Users::Create.run!(remote_id: 2, email: @email)

    @team = Doorbell::Mutation::Teams::Create.run!(user: @user, name: 'Name', email: @email)
  end

  describe '::by_id' do
    it 'should return the user' do
      expect(users.by_id(@user.id).one).to eql(@user)
    end
  end

  describe '::by_ids' do
    it 'should return the users' do
      expect(users.by_ids([@user.id, @other_user.id]).to_a).to contain_exactly(@other_user, @user)
    end
  end

  describe '::by_email' do
    it 'should return the user' do
      expect(users.by_id(@user.id).one).to eql(@user)
    end
  end
end
