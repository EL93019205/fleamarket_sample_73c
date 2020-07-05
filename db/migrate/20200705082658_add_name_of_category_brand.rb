class AddNameOfCategoryBrand < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :name, :string, null: false, index: true
    add_column :categories, :name, :string, null: false, index: true
  end
end
