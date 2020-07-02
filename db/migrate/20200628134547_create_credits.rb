class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string "card_fullname", null:false
      t.string "card_number", limit: 16, unique: true, null: false
      t.integer "expiration_year", null: false
      t.integer "expiration_month", null: false
      t.string "security_code", limit: 4, null: false
      t.references "user", foreign_key: true, unique: true, null: false
      t.timestamps
    end
  end
end