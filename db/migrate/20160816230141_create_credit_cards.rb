class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.string :card_type
      t.string :name
      t.string :cvv
      t.date :expiry_date
      t.string :crn
      t.references :environment, foreign_key: true, null: false
      t.string :notes
      t.string :return_code

      t.timestamps
    end
  end
end
