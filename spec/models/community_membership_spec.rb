require 'rails_helper'

RSpec.describe CommunityMembership, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:community_id) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:community_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:community) }
  end

  describe 'enum roles' do
    it { should define_enum_for(:role).with_values(member: 0, owner: 1, moderator: 2) }
  end

  describe '#member?' do
    it 'returns true when role is member' do
      membership = build(:community_membership, role: :member)
      expect(membership.member?).to be true
    end

    it 'returns false when role is not member' do
      membership = build(:community_membership, role: :owner)
      expect(membership.member?).to be false
    end
  end

  describe '#owner?' do
    it 'returns true when role is owner' do
      membership = build(:community_membership, role: :owner)
      expect(membership.owner?).to be true
    end

    it 'returns false when role is not owner' do
      membership = build(:community_membership, role: :member)
      expect(membership.owner?).to be false
    end
  end

  describe '#moderator?' do
    it 'returns true when role is moderator' do
      membership = build(:community_membership, role: :moderator)
      expect(membership.moderator?).to be true
    end

    it 'returns false when role is not moderator' do
      membership = build(:community_membership, role: :member)
      expect(membership.moderator?).to be false
    end
  end
end