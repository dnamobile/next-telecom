class Endereco < ApplicationRecord
    belongs_to :logradouro
    has_one :local
    has_one :cobertura

    accepts_nested_attributes_for :local, :cobertura 

    validates :logradouro, presence: true
    validates :numero, presence: true

    def nome_local
        if self.local.blank? 
            "-"
        else 
            self.local.nome 
        end    
    end

    def atividade_local
        if self.local.blank? 
            "-"
        else 
            self.local.atividade 
        end    
    end

    def eql(e)
        if !e.logradouro.blank? && !e.logradouro.eql(logradouro)
            return false
        end
        if !e.numero.blank? && !e.numero.eql(numero)
            return false
        end
        if !e.complemento.blank? nil && !e.complemento.eql(complemento)
            return false
        end
        return true
    end

    def to_s
        s = logradouro.nome + ", " + numero
        if !complemento.blank?
            s += ". " + complemento
        end
        if !logradouro.bairro.blank?
            s += " - " + logradouro.bairro.to_s
        end
        s += ", " + logradouro.cep + ", Brasil"
    end
    
end
