class Pessoa < ApplicationRecord
  
  belongs_to :endereco
  belongs_to :user
  has_many :atendimentos

  validates :nome, presence: true
  validates :telefone, presence: true

  def eql(p)
    if p.nome != nil && !p.nome.eql(nome)
      false
    end
    if p.email != nil && !p.email.eql(email)
      false
    end
    if p.telefone != nil && !p.telefone.eql(telefone)
      false
    end
    true
end

  def to_s
    s = nome
    if telefone != nil
        s += " - " + telefone
    end
    if email != nil
      s += " - " + email
    end
  end

end
