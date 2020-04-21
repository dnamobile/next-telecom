class CreateEnderecos < ActiveRecord::Migration[6.0]
  def change
    create_table :enderecos do |t|
      t.string :numero
      t.string :complemento

      t.references :logradouro, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
