class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :candidate, index: true, foreign_key: true
      t.datetime :begins_at

      t.timestamps null: false
    end
  end
end
