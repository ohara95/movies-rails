class CreateSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :sheets do |t|
      t.integer :column, null: false, :limit => 5
      t.string :row, null: false, :limit => 1

    end
  end
end
