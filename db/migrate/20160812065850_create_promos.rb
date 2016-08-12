class CreatePromos < ActiveRecord::Migration[5.0]
  def change
    create_table :promos do |t|
      t.string :code
      t.string :product
      t.references :environment, foreign_key: true, null: false

      t.timestamps
    end

    add_foreign_key :promos, :environments
  end
end
