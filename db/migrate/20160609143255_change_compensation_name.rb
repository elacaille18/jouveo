class ChangeCompensationName < ActiveRecord::Migration
  def change
    rename_column :candidates, :compensation, :compensation_fix
    add_column :candidates, :compensation_variable, :string
    add_column :candidates, :compensation_others, :string
  end
end
