class CreateMissionsUsers < ActiveRecord::Migration
  def change
    create_table :missions_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :mission, index: true
    end
  end
end
