class CreateDiplomas < ActiveRecord::Migration
  def change
    create_table :diplomas do |t|
      t.references :school, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.integer :year

      t.timestamps null: false
    end
  end
end
