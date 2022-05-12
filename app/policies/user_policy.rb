class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    record == user
  end

  def create?
    record == user
  end

  def update?
    edit?
  end

  def edit?
    record == user
  end

  def destroy?
    record == user
  end
end
