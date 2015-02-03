class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :seat

      t.timestamps
    end
  end
end
