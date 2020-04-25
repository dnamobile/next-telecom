class Cobertura < ApplicationRecord
    belongs_to :endereco
    
    validates :endereco, presence: true, uniqueness: true


    def eql(c)
        c == null ? false : endereco.eql(c.endereco);
    end

    def to_s
        endereco.to_s
    end
end
