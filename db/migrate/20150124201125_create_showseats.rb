class CreateShowseats < ActiveRecord::Migration
  def change
    create_table :showseats do |t|
      t.references :show, index: true
      t.references :seat, index: true
      t.integer :status
      t.references :reservation, index: true
      t.references :purchase, index: true
      t.timestamps
    end
  end
end
