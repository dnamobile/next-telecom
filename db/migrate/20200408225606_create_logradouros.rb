class CreateLogradouros < ActiveRecord::Migration[6.0]
  def change
    create_table :logradouros do |t|
      t.string :cep
      t.string :nome
      t.integer :inicio
      t.integer :fim
      t.string :lado
 
      t.references :bairro, index: true, null: false, foreign_key: true
      t.references :cidade, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end

end
