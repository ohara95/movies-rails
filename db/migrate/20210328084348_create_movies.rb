class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.string :description
      t.string :image_url
      t.boolean :is_showing

      t.timestamps
    end
  end
end
