class TresorPolicy < ApplicationPolicy

  def create?
    return true
  end

  def show?
    return true
  end

  def new?
    true
  end

  def destroy?
    record.pirate == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
