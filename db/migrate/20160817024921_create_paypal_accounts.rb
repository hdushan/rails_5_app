class CreatePaypalAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :paypal_accounts do |t|
      t.string :user_name
      t.string :password
      t.references :environment, foreign_key: true, null: false
      t.string :notes

      t.timestamps
    end
  end
end
