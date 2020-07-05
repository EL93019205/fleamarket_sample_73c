class DropTableOfBrand < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :brand, foreign_key: true
    drop_table :brands
  end
end
