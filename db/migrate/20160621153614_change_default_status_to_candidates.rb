class ChangeDefaultStatusToCandidates < ActiveRecord::Migration
  def change
    change_column :candidates, :status, :string, :default => "jouve_interviewing"
  end
end
