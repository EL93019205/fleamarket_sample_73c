class ChangeColumnPathToAncestryOfCategoryBrand < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :path, :string
    remove_column :categories, :path, :string

    remove_column :brands, :name, :string, null: false, index: true
    remove_column :categories, :name, :string, null: false, index: true

    add_column :brands, :ancestry, :string
    add_column :categories, :ancestry, :string

    add_column :brands, :name, :string, null: false
    add_column :categories, :name, :string, null: false
  end
end
