class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :introduction, :text, null: false
    add_reference :items, :user, null: false, foreign_key: true
    add_column :items, :condition, :integer, null: false
    add_column :items, :trading_status, :integer, null: false
    add_column :items, :shipping_area, :integer, null: false
    add_column :items, :shipping_days, :integer, null: false
    add_column :items, :shipping_price, :integer, null: false
  end
end
