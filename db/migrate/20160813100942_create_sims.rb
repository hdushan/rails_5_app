class CreateSims < ActiveRecord::Migration[5.0]
  def change
    create_table :sims do |t|
      t.string :sim_number
      t.string :sim_type
      t.references :environment, foreign_key: true, null: false
      t.string :notes
      t.boolean :in_use, default: false

      t.timestamps
    end
  end
end
