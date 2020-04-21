class Bairro < ApplicationRecord
    belongs_to :cidade
    has_many :logradouros, inverse_of: :bairro  
    
    validates :nome, presence: true, uniqueness: true
    validates :cidade, presence: true

    ZONA_NORTE = "Norte"
    ZONA_SUL = "Sul"
    ZONA_LESTE = "Leste"
    ZONA_SUDESTE = "Sudeste"
    

    def to_s
        s = nome
        if cidade != nil
            s += ", " + cidade.to_s
        end
        s
    end
end
