class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    record.id == user.id
  end

  def create?
    record.id == user.id
  end

  def update?
    edit?
  end

  def edit?
    record.id == user.id
  end

  def destroy?
    record.id == user.id
  end
end
