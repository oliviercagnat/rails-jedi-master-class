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

<<<<<<< HEAD
  def destroy?
    user.status == "Padawan"
  end
=======
    def destroy?
      user.status == "Padawan"
    end

    def update
      user.status = "Jedi"
    end

>>>>>>> 2ac770124725521c1d65cf25e3d2d538ae3bc535
end
