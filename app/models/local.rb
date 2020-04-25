class Local < ApplicationRecord
    belongs_to :endereco

    validates :nome, presence: true
    validates :endereco, presence: true

    def eql(l) 
        if l != nil
            if l.endereco != null && !l.endereco.eql(endereco) 
                return false 
            end
            if l.nome != nil && !l.nome.eq(nome)
                return false
            end
            if l.atividade != nil && !l.atividade.eq(atividade) 
                return false
            end
        end
        return true
    end

    def to_s
        nome + " - " + endereco.to_s
    end
end