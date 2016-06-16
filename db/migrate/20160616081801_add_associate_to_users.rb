class AddAssociateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jouve_associate, :boolean, default: false
  end
end
