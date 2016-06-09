class ChangeStatusdefaultInCandidates < ActiveRecord::Migration
  def change
    change_column_default :candidates, :status, "contact_in_progress"
  end
end
