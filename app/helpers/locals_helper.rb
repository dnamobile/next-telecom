module LocalsHelper

    def set_atividades
        ["Comercial", "Residencial"]
    end
  
    def set_enderecos
        e = Array.new
        e[0] = Endereco.first
        e[1] = Endereco.find(100)
        @enderecos = e
    end

end
