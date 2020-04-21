module CoberturasHelper

    def enderecos
        e = Array.new
        e[0] = Endereco.first
        e[1] = Endereco.find(100)
        @enderecos = e
    end

end
