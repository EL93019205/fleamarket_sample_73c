class AddColumn1ToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthday_year, :integer, null: false
    add_column :users, :birthday_month, :integer, null: false
    add_column :users, :birthday_day, :integer, null: false
  end
end
