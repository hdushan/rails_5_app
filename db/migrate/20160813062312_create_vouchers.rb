class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.string :code
      t.string :product
      t.string :voucher_type
      t.date :expiry_date
      t.float :value
      t.string :notes
      t.references :environment, foreign_key: true, null: false

      t.timestamps
    end
  end
end
