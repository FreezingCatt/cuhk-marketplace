class Community < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :memberships, class_name: 'CommunityMembership', dependent: :destroy
  has_many :members, through: :memberships, source: :user

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :rules, length: { maximum: 1000 }

  scope :active, -> { where(active: true) }
  scope :public_communities, -> { where(is_public: true) }
end
