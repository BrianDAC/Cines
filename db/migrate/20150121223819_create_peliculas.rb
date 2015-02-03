class CreatePeliculas < ActiveRecord::Migration
  def change
    create_table :peliculas do |t|
      t.string :tite
      t.string :category
      t.integer :length
      t.string :description
      t.string :picture

      t.timestamps
    end
  end
end
