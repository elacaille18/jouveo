class AddJouveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jouve, :boolean, null: false, default: false
  end
end
