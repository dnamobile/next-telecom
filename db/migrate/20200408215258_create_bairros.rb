class CreateBairros < ActiveRecord::Migration[6.0]
  def change
    create_table :bairros do |t|
      t.string :zona
      t.string :nome
      t.integer :qtde_habitantes
      t.integer :qtde_domicilios
      t.integer :qtde_empresas
      t.float :renda_media
      
      t.references :cidade, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
