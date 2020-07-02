class AddColumn2ToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :d_family_name, :string, null: false
    add_column :users, :d_first_name, :string, null: false
    add_column :users, :d_family_name_kana, :string, null: false
    add_column :users, :d_first_name_kana, :string, null: false
    add_column :users, :zipcode, :string, limit: 7, null:false
    add_column :users, :prefecture, :integer, null:false
    add_column :users, :city, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :building_name, :string
    add_column :users, :phone_number, :string, limit: 11
  end
end
