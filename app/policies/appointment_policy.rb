class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user_is_jouve
  end

  def update?
    user_is_jouve
  end

  def edit?
    update?
  end

  private

  def user_is_jouve
    user.jouve
  end
end
