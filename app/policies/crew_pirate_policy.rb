class CrewPiratePolicy < ApplicationPolicy
  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    true
  end

  def destroy?
    record[0].pirate.id == user.id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end

