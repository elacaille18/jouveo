class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :company, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.date :starts_on
      t.date :ends_on
      t.string :position

      t.timestamps null: false
    end
  end
end
