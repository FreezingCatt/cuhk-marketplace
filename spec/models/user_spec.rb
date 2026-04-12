require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:community_memberships) }
    it { should have_many(:communities).through(:community_memberships) }
  end

  describe '#verified?' do
    it 'returns true when confirmed_at is set' do
      user = build(:user, confirmed_at: Time.now)
      expect(user.verified?).to be true
    end

    it 'returns false when confirmed_at is nil' do
      user = build(:user, confirmed_at: nil)
      expect(user.verified?).to be false
    end
  end

  describe 'enum roles' do
    it { should define_enum_for(:role).with_values(user: 0, community_manager: 1, admin: 2) }
  end
end
