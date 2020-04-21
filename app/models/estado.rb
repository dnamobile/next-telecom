class Estado < ApplicationRecord
    has_many :cidades, inverse_of: :estado

    validates :nome, presence: true, uniqueness: true
    validates :uf, presence: true, uniqueness: true

    def to_s
        nome
    end
end
