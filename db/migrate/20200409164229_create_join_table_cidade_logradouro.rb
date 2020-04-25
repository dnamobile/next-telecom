class CreateJoinTableCidadeLogradouro < ActiveRecord::Migration[6.0]
  def change
    create_join_table :cidades, :logradouros do |t|
      t.index [:cidade_id, :logradouro_id]
      t.index [:logradouro_id, :cidade_id]
    end
  end
end
