class AddFields < ActiveRecord::Migration[6.0]
  def self.change
    add_reference :atendimento, :pessoa, null: false, foreign_key: true
    add_reference :atendimento, :endereco, null: false, foreign_key: true

    add_reference :pessoas, :endereco, null: false, foreign_key: true
    add_reference :pessoas, :user, null: false, foreign_key: true
  end
end
