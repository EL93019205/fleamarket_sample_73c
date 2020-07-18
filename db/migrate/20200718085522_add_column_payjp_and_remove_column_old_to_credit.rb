class AddColumnPayjpAndRemoveColumnOldToCredit < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :card_fullname, :string, null:false
    remove_column :credits, :card_number, :string, limit: 16, unique: true, null: false
    remove_column :credits, :security_code, :string, limit: 4, null: false
    remove_column :credits, :expiration, :date, null: false
    add_column :credits, :customer_id, :string, null: false
    add_column :credits, :card_id, :string, null: false
  end
end
