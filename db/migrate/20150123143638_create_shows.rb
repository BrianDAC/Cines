class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.references :schedule, index: true
      t.references :pelicula, index: true
      t.references :room, index: true
      t.integer :status

      t.timestamps
    end
  end
end
