class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    record.user == user
  end

  def create?
    record.user == user
  end

  def update?
    edit?
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
