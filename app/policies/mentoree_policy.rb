class MentoreePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # TODO: Scope this only for the mentorees I follow
      scope.all
    end
  end

  def create?
    user.present?
  end

  def show?
    user.present?
  end
end
