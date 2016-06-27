class DropContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :candidate_id
    remove_column :contracts, :company_id
    drop_table :contracts
  end
end
