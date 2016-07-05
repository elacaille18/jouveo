class AddCompanyIdToCandidate < ActiveRecord::Migration
  def change
    add_reference :candidates, :company, index: true, foreign_key: true
  end
end
