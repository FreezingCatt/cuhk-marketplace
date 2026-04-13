require 'rails_helper'

RSpec.describe CommunityPolicy, type: :policy do
  subject(:policy) { described_class }

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:community) { create(:community, owner: user) }

  permissions :index? do
    it 'grants access to everyone' do
      expect(policy).to permit(user, community)
      expect(policy).to permit(nil, community)
    end
  end

  permissions :show? do
    it 'grants access to everyone' do
      expect(policy).to permit(user, community)
      expect(policy).to permit(nil, community)
    end
  end

  permissions :create? do
    it 'grants access to authenticated users' do
      expect(policy).to permit(user, community)
    end

    it 'denies access to unauthenticated users' do
      expect(policy).not_to permit(nil, community)
    end
  end

  permissions :update? do
    it 'grants access to the community owner' do
      expect(policy).to permit(user, community)
    end

    it 'grants access to admin users' do
      admin = create(:user, :admin)
      expect(policy).to permit(admin, community)
    end

    it 'grants access to community managers' do
      manager = create(:user, :community_manager)
      expect(policy).to permit(manager, community)
    end

    it 'denies access to other users' do
      expect(policy).not_to permit(other_user, community)
    end
  end

  permissions :destroy? do
    it 'grants access to the community owner' do
      expect(policy).to permit(user, community)
    end

    it 'grants access to admin users' do
      admin = create(:user, :admin)
      expect(policy).to permit(admin, community)
    end

    it 'denies access to community managers' do
      manager = create(:user, :community_manager)
      expect(policy).not_to permit(manager, community)
    end

    it 'denies access to other users' do
      expect(policy).not_to permit(other_user, community)
    end
  end
end