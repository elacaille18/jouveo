class AddTeamToMissions < ActiveRecord::Migration
  def change
    add_reference :missions, :associate, references: :users, index: true
    add_foreign_key :missions, :users, column: :associate_id
    add_reference :missions, :consultant, references: :users, index: true
    add_foreign_key :missions, :users, column: :consultant_id
    add_reference :missions, :assistant, references: :users, index: true
    add_foreign_key :missions, :users, column: :assistant_id
  end
end
