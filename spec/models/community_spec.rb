require 'rails_helper'

RSpec.describe Community, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:owner).class_name('User') }
    it { should have_many(:memberships) }
    it { should have_many(:members).through(:memberships) }
  end

  describe 'scopes' do
    describe '.active' do
      it 'returns only active communities' do
        active = create(:community, active: true)
        inactive = create(:community, active: false)
        expect(Community.active).to include(active)
        expect(Community.active).not_to include(inactive)
      end
    end
  end
end
