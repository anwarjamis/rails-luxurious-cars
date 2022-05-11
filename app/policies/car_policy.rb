class CarPolicy < ApplicationPolicy
  class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    edit?
  end

  def edit?
    record.user == user
  end

  def my_cars?
    return true
  end

  def destroy?
    record.user == user
  end
end
