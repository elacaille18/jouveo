class DropSchooltable < ActiveRecord::Migration
  def change
    remove_column :diplomas, :school_id
    drop_table :schools
  end
end
