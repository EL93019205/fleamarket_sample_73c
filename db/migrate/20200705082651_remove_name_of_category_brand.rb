class RemoveNameOfCategoryBrand < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :name, :string, null: false, unique: true, index: true
    remove_column :categories, :name, :string, null: false, unique: true, index: true
  end
end
