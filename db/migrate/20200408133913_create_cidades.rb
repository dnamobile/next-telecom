class CreateCidades < ActiveRecord::Migration[6.0]
  def change
    create_table :cidades do |t|
      t.string :nome
      t.references :estado, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
