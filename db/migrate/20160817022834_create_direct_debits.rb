class CreateDirectDebits < ActiveRecord::Migration[5.0]
  def change
    create_table :direct_debits do |t|
      t.string :bsb
      t.string :account_number
      t.references :environment, foreign_key: true, null: false
      t.string :notes

      t.timestamps
    end
  end
end
