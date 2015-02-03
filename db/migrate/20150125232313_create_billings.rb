class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.references :reservation
      t.references :purchase
      t.decimal :total_amount
      t.integer :status

      t.timestamps
    end
  end
end
