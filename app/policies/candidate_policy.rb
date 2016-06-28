class CandidatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    create?
  end

  def create?
    user_is_jouve?
  end

  def edit?
    update?
  end

  def update?
    user_is_part_of_mission? || user.jouve_associate
  end

  def destroy?
    # user is admin
    user_is_part_of_mission?
  end

  private

  def user_is_part_of_mission?
    record.mission.creator == user || record.mission.associate == user || record.mission.consultant == user || record.mission.assistant == user
  end

  def user_is_owner_or_admin?
    user.admin || record.mission.creator == user
  end

  def user_is_admin
    user.admin
  end

  def user_is_jouve?
    user.jouve
  end
end
