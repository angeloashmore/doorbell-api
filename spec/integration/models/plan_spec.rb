require 'spec_helper'

describe Plan do
  before :all do
    @user = Doorbell::Mutation::Users::Create.run!(remote_id: 1, email: 'name@example.com') 
    @plan = Plan.new
  end

  describe '#viewable_by?' do
    it 'should be true for anyone' do
      expect(@plan.viewable_by?(@user)).to be true
    end
  end

  describe '#creatable_by?' do
    it 'should be false for anyone' do
      expect(Plan.new.creatable_by?(@user)).to be false
    end
  end

  describe '#updatable_by?' do
    it 'should be false for anyone' do
      expect(@plan.updatable_by?(@user)).to be false
    end
  end

  describe '#deletable_by?' do
    it 'should be false for anyone' do
      expect(@plan.deletable_by?(@user)).to be false
    end
  end
end
