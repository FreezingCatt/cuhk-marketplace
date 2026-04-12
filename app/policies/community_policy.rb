class CommunityPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.owner == user || user.admin? || user.community_manager?)
  end

  def destroy?
    user.present? && (record.owner == user || user.admin?)
  end
end
