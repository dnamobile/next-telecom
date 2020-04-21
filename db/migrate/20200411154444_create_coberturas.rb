class CreateCoberturas < ActiveRecord::Migration[6.0]
  def change
    create_table :coberturas do |t|
      t.integer :vivo
      t.integer :net
      t.integer :oi
      t.references :endereco, index: true

      t.timestamps
    end
  end
end
