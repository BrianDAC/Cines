class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|

      t.string :name
      t.string :lastname
      t.string :email
      t.integer :ci
      t.integer :elderly
      t.string :seat
      t.references :show, index: true


      t.timestamps
    end
  end
end
