class CommunityMembership < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :user_id, uniqueness: { scope: :community_id }

  enum role: { member: 0, moderator: 1 }, _default: :member
end
