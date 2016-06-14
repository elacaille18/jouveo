class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.jouve
        scope.where("creator_id = ? or associate_id = ? or consultant_id = ? or assistant_id = ?", user, user, user, user)
      else
        scope.joins(:users).where(missions_users: { user_id: user.id })
      end

    end
  end

  def index?
    user_is_owner_or_admin?
  end

  def show?
    user_is_part_of_mission?
    #user_is_owner_or_admin?  A faire plus tard une fois que les admins seront crées
  end

  def new?
    create?
  end

  def create?
      user_is_jouve# Anyone can create a trip
  end

  def edit
    update?
  end


  def update?
    #record.user <=> @trip.user AND user <=> current_user dans les politiques
    #user_is_owner_or_admin? # Only trip creator can update it and admin
    user_is_part_of_mission? && user_is_jouve
  end

  def destroy?
    user_is_owner_or_admin? # Only trip creator can update it or admin
  end

  private

  def user_is_part_of_mission?
    record.creator == user || record.associate == user || record.consultant == user || record.assistant == user || record.users.include?(user)
  end
  def user_is_owner_or_admin?
    user.admin || record.creator == user
  end

  def user_is_admin
    user.admin
  end

  def user_is_jouve
    user.jouve
  end
end
