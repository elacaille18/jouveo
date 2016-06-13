class AddUniqToMissionsUsers < ActiveRecord::Migration
  def change
    add_index :missions_users, [ :mission_id, :user_id ], :unique => true, :name => 'by_mission_and_user'
  end
end
