class ChangeBirthdayOfUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :date, null: false
    remove_column :users, :birthday_year, :integer, null: false
    remove_column :users, :birthday_month, :integer, null: false
    remove_column :users, :birthday_day, :integer, null: false
  end
end
