class Cobertura < ApplicationRecord
    belongs_to :endereco
    
    validates :endereco, presence: true, uniqueness: true
    validates :vivo, numericality: true
    validates :net, numericality: true
    validates :oi, numericality: true


    def eql(c)
        c == null ? false : endereco.eql(c.endereco);
    end

    def to_s
        endereco.to_s
    end
end
