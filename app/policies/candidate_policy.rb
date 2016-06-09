class CandidatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
    # a verifier
  end

  def create?
    true
    # A verifier
  end

  def edit?
    true
    # A verifier
  end

  def update?
    true
    # A verifier
  end

  def destroy?
    # user is admin
    true
  end
end
