class Pessoa < ApplicationRecord
  
  belongs_to :endereco
  belongs_to :user


end
