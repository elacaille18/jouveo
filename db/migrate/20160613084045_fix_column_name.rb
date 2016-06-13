class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :missions, :user_id, :creator_id
  end
end
