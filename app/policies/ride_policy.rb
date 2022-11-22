class RidePolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end

class Scope < Scope

  def resolve
    user.admin? ? scope.all : scope.where(user: user)
  end
end
