require 'spec_helper'

describe Doorbell::Mutation::Users::Delete do
  let(:mutation) { Doorbell::Mutation::Users::Delete }
  let(:user) { Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: 'old@example.com') }
  let(:valid_inputs) { { user: user  } }
  let(:invalid_inputs) { {} }

  context 'with valid inputs' do
    it 'should create a new user and billing record' do
      result = mutation.run!(valid_inputs)
      relation = ROM.env.relation(:users).by_id(user.id)
      expect(relation.one).to be_nil
    end
  end

  context 'with invalid inputs' do
    it 'should raise an error' do
      expect { mutation.run!(invalid_inputs) }.to raise_error(Mutations::ValidationException)
    end
  end
end
