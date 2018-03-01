class PetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def dashboard?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def show_profile
    true
  end
end
