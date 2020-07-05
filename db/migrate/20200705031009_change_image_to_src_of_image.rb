class ChangeImageToSrcOfImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :src, :string, null: false
    remove_column :images, :image, :string, null: false
  end
end
