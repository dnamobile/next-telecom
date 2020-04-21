class CreateLocals < ActiveRecord::Migration[6.0]
  def change
    create_table :locals do |t|
      t.string :nome
      t.string :atividade
      t.integer :qtde_blocos
      t.integer :qtde_lotes
      
      t.references :endereco, index: true

      t.timestamps
    end
  end
end
