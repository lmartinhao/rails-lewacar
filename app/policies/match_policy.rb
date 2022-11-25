class MatchPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def update?
    user.id == record.ride.user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
