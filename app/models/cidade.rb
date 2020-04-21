class Cidade < ApplicationRecord
    belongs_to :estado
    has_many :bairros, inverse_of: :cidade

    validates :nome, presence: true, uniqueness: true
    validates :estado, presence: true

    def to_s
        s = nome
        if estado != nil
            s += "-" + estado.uf
        end
        s
    end
end
