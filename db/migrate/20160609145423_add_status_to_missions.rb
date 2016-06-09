class AddStatusToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :status, :string, default: "in_progress"
  end
end
