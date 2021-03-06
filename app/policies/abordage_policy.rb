class AbordagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return true
  end

  def new?
    true
  end

  def update?
    record.tresor.pirate == user
  end

  def destroy?
    record.user == user
  end

end
