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
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
