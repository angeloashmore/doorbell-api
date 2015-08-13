require 'spec_helper'

describe User do
  before :all do
    @user = Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: 'name@example.com') 
    @other_user = Doorbell::Mutation::Users::Create.run!(remote_id: 2, email: 'name@example.com') 
  end

  describe '#viewable_by?' do
    it 'should be true for anyone' do
      expect(@user.viewable_by?(@user)).to be true
      expect(@user.viewable_by?(@other_user)).to be true
    end
  end

  describe '#creatable_by?' do
    it 'should be true for anyone' do
      expect(User.new.creatable_by?(@user)).to be true
    end
  end

  describe '#updatable_by?' do
    it 'should be true for its user' do
      expect(@user.updatable_by?(@user)).to be true
      expect(@user.updatable_by?(@other_user)).to be false
    end
  end

  describe '#deletable_by?' do
    it 'should be false for anyone' do
      expect(@user.deletable_by?(@user)).to be false
    end
  end
end
