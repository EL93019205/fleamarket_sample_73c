class AddColumn1ToUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :birthday_year, null: false
      t.integer :birthday_month, null: false
      t.integer :birthday_day, null: false
  end
end
