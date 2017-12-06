class CrewPiratesPolicy < ApplicationPolicy
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
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
