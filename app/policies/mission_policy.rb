class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where("creator_id = ? or associate_id = ? or consultant_id = ? or assistant_id = ?", user, user, user, user)
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
    true  # Anyone can create a trip
  end

  def edit
    update?

  end

  def trip_accept_mission?
    true
  end
  # def search?
  #   true
  # end

  def update?
    #record.user <=> @trip.user AND user <=> current_user dans les politiques
    #user_is_owner_or_admin? # Only trip creator can update it and admin
    user_is_part_of_mission
  end

  def destroy?
    user_is_owner_or_admin? # Only trip creator can update it or admin
  end

  private

  def user_is_part_of_mission?
    record.creator == user || record.associate == user || record.consultant == user || record.assistant == user
  end
  def user_is_owner_or_admin?
    user.admin || record.creator == user
  end

  def user_is_admin
    user.admin
  end
end
