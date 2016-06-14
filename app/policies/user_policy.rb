class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def profile?
    true
  end

  def edit?
    true
  end

  def new_client?
    true
    #a modifier si nécessaire
  end
end
