class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      user.status == "Jedi"
    end

    def update?
      user.status == "Jedi"
    end

    def index?
      true
    end

    def show?
      true
    end

    def destroy?
      user.status == "Jedi"
    end
end
