class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :name
      t.string :lastname
      t.integer :ci
      t.string :email
      t.integer :elderly
      t.string :seat
      t.references :show, index: true

      t.timestamps
    end
  end
end
