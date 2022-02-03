class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.status == "Padawan"
  end

  def show?
    true
  end

  def index?
    user.status = "Jedi"
  end

  def destroy?
    user.status == "Padawan"
  end

  def update?
    user.status = "Jedi"
  end
end
