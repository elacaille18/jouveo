class DropDiplomas < ActiveRecord::Migration
  def change
    remove_column :diplomas, :candidate_id
    drop_table :diplomas
  end
end
