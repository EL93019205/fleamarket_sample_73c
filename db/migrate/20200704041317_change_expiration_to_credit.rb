class ChangeExpirationToCredit < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :expiration, :date, null: false
    remove_column :credits, :expiration_year, :integer, null: false
    remove_column :credits, :expiration_month, :integer, null: false
  end
end
