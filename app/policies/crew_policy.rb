class CrewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def decouvrir?
    return true
  end

  def show?
    return true
  end

  def pirates?
    return show?
  end

  def create?
    return true
  end

  def update?
    true
  end

end
