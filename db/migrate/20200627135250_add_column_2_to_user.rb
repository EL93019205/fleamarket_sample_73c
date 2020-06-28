class AddColumn2ToUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :d_family_name, null: false
      t.string :d_first_name, null: false
      t.string :d_family_name_kana, null:false
      t.string :d_first_name_kana, null:false
      t.string :zipcode, limit: 7, null:false
      t.integer :prefecture, null:false
      t.string :city, null: false
      t.string :address, null:false
      t.string :building_name
      t.string :phone_number, limit: 11
  end
end
