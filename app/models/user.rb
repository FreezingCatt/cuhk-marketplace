class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable

  enum role: { user: 0, community_manager: 1, admin: 2 }, _default: :user

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }

  has_many :community_memberships, dependent: :destroy
  has_many :communities, through: :community_memberships
  has_many :owned_communities, class_name: 'Community', foreign_key: 'owner_id', dependent: :nullify

  after_initialize :set_default_role, if: :new_record?

  def verified?
    confirmed_at.present?
  end

  def member_of?(community)
    communities.include?(community)
  end

  def can_manage_community?(community)
    community_manager? || admin? || community.owner == self
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
