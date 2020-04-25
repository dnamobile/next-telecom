module CoberturasHelper

    def enderecos
        e = Array.new
        e[0] = Endereco.first
        e[1] = Endereco.find(100)
        @enderecos = e
    end

    def parse(cob)
        if cob == nil
            "Inviável"
        else
            if cob == 0
                "Indisponível"
            else
                cob.to_s
            end
        end
    end
    
end
