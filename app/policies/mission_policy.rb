class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.jouve
        if user.jouve_associate
          # Membre associé
          scope.all
        else
          #Membre non associé
          scope.where("creator_id = ? or associate_id = ? or consultant_id = ? or assistant_id = ?", user, user, user, user)
        end
      else
        scope.joins(:users).where(missions_users: { user_id: user.id })
      end

    end
  end

  def index?
    user_is_owner_or_admin?
  end

  def show?
    # Peuvent voir ceux qui font partie de la mission ou ceux sont qui sont associés
    user_is_part_of_mission? || user.jouve_associate
    #user_is_owner_or_admin?  A faire plus tard une fois que les admins seront crées
  end

  def new?
    create?
  end

  def create?
      user_is_jouve
      # Only Jouve member can create a mission
  end

  def edit
    update?
  end


  def update?
    # L'utilisateur fait partie de la mission mais doit aussi être membre de jouve
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
