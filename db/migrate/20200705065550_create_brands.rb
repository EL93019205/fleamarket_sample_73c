class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string "name", null: false, unique: true, index: true
      t.string "path", null: false, unique: true
      t.timestamps
    end
  end
end
