class UserPolicy < ApplicationPolicy

  def show?
    true
  end

  class Scope
    def resolve
      scope.all
    end
  end
end
