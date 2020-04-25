class CreateCoberturas < ActiveRecord::Migration[6.0]
  def change
    create_table :coberturas do |t|
      t.integer :vivo, defaul: => 0
      t.integer :net, defaul: => 0
      t.integer :oi, defaul: => 0
      t.references :endereco, index: true

      t.timestamps
    end
  end
end
