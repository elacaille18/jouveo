class AddCompanyToMissions < ActiveRecord::Migration
  def change
    add_reference :missions, :company, index: true, foreign_key: true
  end
end
