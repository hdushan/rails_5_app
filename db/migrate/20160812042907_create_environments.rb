class CreateEnvironments < ActiveRecord::Migration[5.0]
  def change
    create_table :environments do |t|
      t.string :name, null: false
      t.string :url
      t.boolean :is_prod_data
      t.index :name, unique: true
      t.timestamps
    end
  end
end
