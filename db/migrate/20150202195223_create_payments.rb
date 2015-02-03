class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :cardnumber
      t.string :cardtype
      t.date :pay_date
      t.date :due_date
      t.string :cardname
      
      t.references :billing, index: true

      t.timestamps
    end
  end
end
