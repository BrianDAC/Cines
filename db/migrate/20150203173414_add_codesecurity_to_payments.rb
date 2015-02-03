class AddCodesecurityToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :codesecurity, :string
  end
end
