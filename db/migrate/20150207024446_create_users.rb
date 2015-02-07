class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :cel
      t.string :ci
      t.date :dateregister
      t.string :password

      t.timestamps
    end
  end
end
