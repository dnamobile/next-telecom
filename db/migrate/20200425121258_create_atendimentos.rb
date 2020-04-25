class CreateAtendimentos < ActiveRecord::Migration[6.0]
  def self.change
    create_table :atendimentos do |t|
      t.string :etapa
      t.datetime :data
      t.references :pessoa, null: false, foreign_key: true
      t.references :endereco, null: false, foreign_key: true
      t.string :operadora
      t.string :portfolio

      t.timestamps
    end
  end
end
