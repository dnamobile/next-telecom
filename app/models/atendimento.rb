class Atendimento < ApplicationRecord
  belongs_to :pessoa
  belongs_to :endereco
end
