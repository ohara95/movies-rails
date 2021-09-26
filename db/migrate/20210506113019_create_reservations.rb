class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :date, null: false
      t.references :schedule, foreign_key: true, null: false
      t.references :sheet, foreign_key: true, null: false
      t.references :movie, foreign_key: true
      t.string :email, null: false, :limit => 255
      t.string :name, null: false, :limit => 50

      t.timestamps
    end
  end
end
