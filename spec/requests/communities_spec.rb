require 'rails_helper'

RSpec.describe '/communities', type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:community) { create(:community, owner: user) }

  describe 'GET /communities' do
    context 'when authenticated' do
      before { sign_in user }

      it 'returns a success response' do
        get communities_path
        expect(response).to be_successful
      end

      it 'assigns communities' do
        community
        get communities_path
        expect(assigns(:communities)).to include(community)
      end
    end

    context 'when unauthenticated' do
      it 'returns a success response' do
        get communities_path
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /communities/:id' do
    context 'when authenticated' do
      before { sign_in user }

      it 'returns a success response' do
        get community_path(community)
        expect(response).to be_successful
      end

      it 'assigns the community' do
        get community_path(community)
        expect(assigns(:community)).to eq(community)
      end
    end

    context 'when unauthenticated' do
      it 'returns a success response' do
        get community_path(community)
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /communities/new' do
    context 'when authenticated' do
      before { sign_in user }

      it 'returns a success response' do
        get new_community_path
        expect(response).to be_successful
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in' do
        get new_community_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /communities' do
    context 'when authenticated with valid params' do
      before { sign_in user }

      it 'creates a new community' do
        expect {
          post communities_path, params: { community: attributes_for(:community) }
        }.to change(Community, :count).by(1)
      end

      it 'redirects to the created community' do
        post communities_path, params: { community: attributes_for(:community) }
        expect(response).to redirect_to(Community.last)
      end
    end

    context 'when authenticated with invalid params' do
      before { sign_in user }

      it 'does not create a new community' do
        expect {
          post communities_path, params: { community: attributes_for(:community, name: nil) }
        }.not_to change(Community, :count)
      end

      it 'renders the new template' do
        post communities_path, params: { community: attributes_for(:community, name: nil) }
        expect(response).to render_template(:new)
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in' do
        post communities_path, params: { community: attributes_for(:community) }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /communities/:id/edit' do
    context 'when authenticated as owner' do
      before { sign_in user }

      it 'returns a success response' do
        get edit_community_path(community)
        expect(response).to be_successful
      end
    end

    context 'when authenticated as non-owner' do
      before { sign_in other_user }

      it 'redirects to the community' do
        get edit_community_path(community)
        expect(response).to redirect_to(community)
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in' do
        get edit_community_path(community)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT /communities/:id' do
    context 'when authenticated as owner with valid params' do
      before { sign_in user }

      it 'updates the community' do
        new_name = 'Updated Community Name'
        put community_path(community), params: { community: { name: new_name } }
        community.reload
        expect(community.name).to eq(new_name)
      end

      it 'redirects to the community' do
        put community_path(community), params: { community: { name: 'New Name' } }
        expect(response).to redirect_to(community)
      end
    end

    context 'when authenticated as owner with invalid params' do
      before { sign_in user }

      it 'does not update the community' do
        original_name = community.name
        put community_path(community), params: { community: { name: nil } }
        community.reload
        expect(community.name).to eq(original_name)
      end

      it 'renders the edit template' do
        put community_path(community), params: { community: { name: nil } }
        expect(response).to render_template(:edit)
      end
    end

    context 'when authenticated as non-owner' do
      before { sign_in other_user }

      it 'redirects to the community' do
        put community_path(community), params: { community: { name: 'New Name' } }
        expect(response).to redirect_to(community)
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in' do
        put community_path(community), params: { community: { name: 'New Name' } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE /communities/:id' do
    context 'when authenticated as owner' do
      before { sign_in user }

      it 'destroys the community' do
        community
        expect {
          delete community_path(community)
        }.to change(Community, :count).by(-1)
      end

      it 'redirects to communities list' do
        delete community_path(community)
        expect(response).to redirect_to(communities_url)
      end
    end

    context 'when authenticated as non-owner' do
      before { sign_in other_user }

      it 'redirects to the community' do
        delete community_path(community)
        expect(response).to redirect_to(community)
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in' do
        delete community_path(community)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end