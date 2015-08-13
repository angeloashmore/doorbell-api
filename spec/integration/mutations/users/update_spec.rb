require 'spec_helper'

describe Doorbell::Mutation::Users::Update do
  let(:mutation) { Doorbell::Mutation::Users::Update }
  let(:user) { Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: 'old@example.com') }
  let(:valid_inputs) { { user: user, email: 'new@example.com' } }
  let(:invalid_inputs) { { email: 'invalid_email' } }

  context 'with valid inputs' do
    it 'should create a new user and billing record' do
      updated_user = mutation.run!(valid_inputs)
      expect(updated_user.email).to eq('new@example.com')
    end
  end

  context 'with invalid inputs' do
    it 'should raise an error' do
      expect { mutation.run!(invalid_inputs) }.to raise_error(Mutations::ValidationException)
    end
  end
end
