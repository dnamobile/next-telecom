class Logradouro < ApplicationRecord
    belongs_to :cidade
    belongs_to :bairro
    has_many :enderecos, inverse_of: :logradouro

    validates :cep, presence: true, uniqueness: true
    validates :nome, presence: true
    validates :cidade, presence: true
    validates :bairro, presence: true
    validates :inicio, numericality: true
    validates :fim, numericality: true
    validates :lado, presence: true

    def eql(l)
        if l.cidade != nil && !l.cidade.eql(cidade)
            return false
        end
        if l.bairro != nil && !l.bairro.eql(bairro)
            return false
        end
        if l.cep != nil && !l.cep.eql(cep)
            return false
        end
        return true
    end

    def to_s
        s = nome
        if bairro != nil
            s += " - " + bairro.to_s
        end
        s += ", " + cep + ", Brasil"
    end
end
