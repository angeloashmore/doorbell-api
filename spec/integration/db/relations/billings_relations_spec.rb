require 'spec_helper'

describe Relations::Billings do
  let(:billings) { ROM.env.relation(:billings).as(:entity) }

  before :all do
    command = ROM.env.command(:plans).as(:entity).create
    @user = User.new(id: 1, email: 'name@example.com')
    @billing = Doorbell::Mutation::Billings::Create.run!(user: @user)
  end

  describe '::by_id' do
    it 'should return the billing' do
      expect(billings.by_id(@billing.id).one).to eql(@billing)
    end
  end

  describe '::for_relation' do
    it 'should return the billing' do
      expect(billings.for_relation(@user).one).to eql(@billing)
    end
  end
end
