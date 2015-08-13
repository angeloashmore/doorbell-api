require 'spec_helper'

describe Doorbell::Mutation::Users::Create do
  let(:mutation) { Doorbell::Mutation::Users::Create }
  let(:valid_inputs) { { remote_id: 1, email: 'name@example.com' } }
  let(:invalid_inputs) { { remote_id: 'one', email: 'invalid_email' } }

  context 'with valid inputs' do
    it 'should create a new user and billing record' do
      user = mutation.run!(valid_inputs)
      billing = ROM.env.relation(:billings).for_relation(user).as(:entity).one
      expect(user).to be_an_instance_of(User)
      expect(billing).to be_an_instance_of(Billing)
    end
  end

  context 'with invalid inputs' do
    it 'should raise an error' do
      expect { mutation.run!(invalid_inputs) }.to raise_error(Mutations::ValidationException)
    end
  end
end
